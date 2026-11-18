    // https://leetcode.cn/problems/lexicographically-smallest-string-after-reverse-ii/
import Foundation
// MARK: - 双哈希（区间查询 O(1)）
struct DoubleHasher {
    static let bases: [UInt64] = [131, 137]
    static let mods: [UInt64] = [1_000_000_007, 1_000_000_009]

    private var h: [[UInt64]] = []
    private var p: [[UInt64]] = []
    let n: Int

    init(_ a: [Character]) {
        n = a.count
        h = Array(repeating: [UInt64](repeating: 0, count: n + 1), count: 2)
        p = Array(repeating: [UInt64](repeating: 1, count: n + 1), count: 2)
        for t in 0..<2 {
            let b = Self.bases[t], m = Self.mods[t]
            for i in 0..<n {
                let v = UInt64(a[i].asciiValue!)
                h[t][i + 1] = (h[t][i] * b + v) % m
                p[t][i + 1] = (p[t][i] * b) % m
            }
        }
    }

    /// [l, r] 闭区间的双哈希，越界直接断言（不要静默返回 0）
    func hash(_ l: Int, _ r: Int) -> (UInt64, UInt64) {
        precondition(l >= 0 && l <= r && r < n, "hash range invalid: [\(l), \(r)], n = \(n)")
        var r1: UInt64 = 0, r2: UInt64 = 0
        for t in 0..<2 {
            let m = Self.mods[t]
            let v = (h[t][r + 1] + m - (h[t][l] * p[t][r - l + 1]) % m) % m
            if t == 0 { r1 = v } else { r2 = v }
        }
        return (r1, r2)
    }
}

// MARK: - 正确解法：候选只有「反转前缀 k」和「反转后缀 k」，各 n 种
// 关键点：相邻候选之间只需要比较「两段」，用哈希 + 二分求 LCP
final class Solution {
    private var a: [Character] = []    // 原串
    private var ra: [Character] = []   // 反转串
    private var h: DoubleHasher!
    private var rh: DoubleHasher!

    /// 返回 -1 / 0 / 1：比较 a[iA...] 与 aB[iB...] 的前 len 个字符
    private func cmp(_ hA: DoubleHasher, _ iA: Int, _ aA: [Character],
                     _ hB: DoubleHasher, _ iB: Int, _ aB: [Character], _ len: Int) -> Int {
        guard len > 0 else { return 0 }
        let x = hA.hash(iA, iA + len - 1), y = hB.hash(iB, iB + len - 1)
        if x == y { return 0 }
        var lo = 0, hi = len - 1
        while lo < hi {                       // 找第一个不相等的位置
            let mid = (lo + hi) >> 1
            if hA.hash(iA, iA + mid) == hB.hash(iB, iB + mid) { lo = mid + 1 } else { hi = mid }
        }
        return aA[iA + lo] < aB[iB + lo] ? -1 : 1
    }

    func lexSmallest(_ s: String) -> String {
        a = Array(s)
        ra = Array(s.reversed())
        let n = a.count
        h = DoubleHasher(a)
        rh = DoubleHasher(ra)

        var best = s                            // k = 1，等于不操作

        // ---- 候选族 1：反转前缀 k 个（k = 1...n）----
        // 结果 = rev(s[0..k-1]) + s[k..]
        var bk = 1
        for k in 2...max(2, n) where k <= n {
            // 位置 [0, bk-1]：cand = ra[n-k ...], best = ra[n-bk ...]
            var c = cmp(rh, n - k, ra, rh, n - bk, ra, bk)
            // 位置 [bk, k-1]：cand = rev 块后半, best = s[bk ...]
            if c == 0 { c = cmp(rh, n - (k - bk), ra, h, bk, a, k - bk) }
            if c < 0 { bk = k }
        }
        best = min(best, String(ra.suffix(bk)) + String(a.suffix(n - bk)))

        // ---- 候选族 2：反转后缀 k 个（等价于从 l 开始反转，l = n-k）----
        // 结果 = s[0..l-1] + rev(s[l..])
        var bl = 1
        for l in 2...max(2, n) where l <= n {
            let delta = l - bl
            // 位置 [bl, l-1]：cand = s[bl ...], best = ra[0 ...]
            var c = cmp(h, bl, a, rh, 0, ra, delta)
            // 位置 [l, n-1]：cand = ra[0 ...], best = ra[delta ...]
            if c == 0 { c = cmp(rh, 0, ra, rh, delta, ra, n - l) }
            if c < 0 { bl = l }
        }
        best = min(best, String(a.prefix(bl)) + String(ra.prefix(n - bl)))

        return best
    }
}

