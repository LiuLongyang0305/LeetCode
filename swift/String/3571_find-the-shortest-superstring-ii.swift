// https://leetcode.cn/problems/find-the-shortest-superstring-ii/
class Solution {
    func shortestSuperstring(_ s1: String, _ s2: String) -> String {
        if s1.contains(s2) {return s1}
        if s2.contains(s1) {return s2}

        let s1Hasher = DoubleStringHasher(s1)
        let s2Hasher = DoubleStringHasher(s2)

        let maxLengthSuffix = solve(s1Hasher, s2Hasher, s1.count, s2.count)
        let maxLengthPreffix = solve(s2Hasher, s1Hasher, s2.count, s1.count)

        if maxLengthSuffix == 0 && maxLengthPreffix == 0 {
            return s1 + s2
        }
        if maxLengthSuffix >= maxLengthPreffix {
            return String(s1.prefix(s1.count - maxLengthSuffix)) + s2
        } else {
            return String(s2.prefix(s2.count - maxLengthPreffix)) + s1
        }

    }

private func solve(_ first: DoubleStringHasher, _ second: DoubleStringHasher, _ l1: Int, _ l2: Int) -> Int {
    // 从最大可能长度开始往下找，找到即是最长匹配
    for mid in stride(from: min(l1, l2), through: 1, by: -1) {
        if first.getDoubleHash(l1 - mid, l1 - 1) == second.getDoubleHash(0, mid - 1) {
            return mid
        }
    }
    return 0
}
}

struct DoubleHashResult:Hashable {
    var h1: UInt64
    var h2: UInt64
}
struct DoubleStringHasher {

    private struct HashParams {
        let base: UInt64
        let mod: UInt64
    }

    // 使用两个不同的参数组，大幅降低碰撞概率
    private let params = [
        HashParams(base: 131, mod: 1_000_000_007),
        HashParams(base: 137, mod: 1_000_000_009)
    ]

    private var prefixHashes: [[UInt64]] = []
    private var powers: [[UInt64]] = []

    init(_ s: String) {
        let n = s.count
        prefixHashes = Array(repeating: Array(repeating: 0, count: n + 1), count: 2)
        powers = Array(repeating: Array(repeating: 1, count: n + 1), count: 2)

        let chars = Array(s)
        for p in 0..<2 {
            let base = params[p].base
            let mod = params[p].mod

            for i in 0..<n {
                let charValue = UInt64(chars[i].asciiValue ?? 0)
                prefixHashes[p][i + 1] = (prefixHashes[p][i] * base + charValue) % mod
                powers[p][i + 1] = (powers[p][i] * base) % mod
            }
        }
    }

    /// 获取子串的双哈希值
    func getDoubleHash(_ l: Int, _ r: Int) -> DoubleHashResult {
        guard l <= r, l >= 0, r < prefixHashes[0].count - 1 else { return  DoubleHashResult(h1: 0, h2: 0)}

        var result = DoubleHashResult(h1: 0, h2: 0)
        for p in 0..<2 {
            let mod = params[p].mod
            let hash = (prefixHashes[p][r + 1] + mod - (prefixHashes[p][l] * powers[p][r - l + 1]) % mod) % mod
            if p == 0 {
                result.h1 = hash
            } else {
                result.h2 = hash
            }
        }
        return result
    }

    /// 比较两个子串是否相等（通过比较哈希值）
    func isEqual(_ l1: Int, _ r1: Int, _ l2: Int, _ r2: Int) -> Bool {
        let hash1 = getDoubleHash(l1, r1)
        let hash2 = getDoubleHash(l2, r2)
        return hash1 == hash2
    }
}

