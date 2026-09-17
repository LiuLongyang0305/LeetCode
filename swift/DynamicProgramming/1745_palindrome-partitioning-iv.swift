// https://leetcode.com/problems/palindrome-partitioning-iv/
class Solution {
    func checkPartitioning(_ s: String) -> Bool {
        guard s.count != 3 else {
            return true
        }
        let s2Chars = [Character](s)
        let N = s.count
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: N)
        (0..<N).forEach {dp[$0][$0] = true}
        for j in 1..<N {
            for i in 0..<j {
                if s2Chars[i] == s2Chars[j] && (j - i < 3 || dp[i + 1][j - 1]) {
                    dp[i][j] = true
                }
            }
        }
        var first = [Int]()
        var second = [Int]()
        for i in 0..<N {
            if dp[0][i] {
                first.append(i)
            }
            if dp[i][N - 1] {
                second.append(i)
            }
        }
        for f in first {
            while !second.isEmpty && second.first! <= f  {
                second.removeFirst()
            }
            guard !second.isEmpty else {
                return false
            }
            for s in second {
                guard !dp[f + 1][s - 1] else {
                    return true
                }
            }
        }
        return false
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

class Solution {
    func checkPartitioning(_ s: String) -> Bool {
        let hasher = DoubleStringHasher(s)
        let rHasher = DoubleStringHasher(String(s.reversed()))
        let M = s.count

        func check(_ l: Int, _ r: Int) -> Bool {
            let ml = M - 1 - r
            let mr = M - 1 - l
            return hasher.getDoubleHash(l, r) == rHasher.getDoubleHash(ml, mr)
        }

        for fe in  0..<M {
            for ts in stride(from:fe + 2 , to: M, by: 1) {
                if check(0, fe) && check(fe + 1, ts - 1) && check(ts, M - 1) {
                    return true
                }
            }
        }

        return false
    }
}
