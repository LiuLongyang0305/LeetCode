 // https://leetcode.com/problems/maximum-number-of-non-overlapping-palindrome-substrings/
class Solution {
    func maxPalindromes(_ s: String, _ k: Int) -> Int {
        guard k > 1 else {return s.count}
        let possibleSplitPoints = splitSubstrings(s, k)
        let N = s.count
        var memo = [Int?](repeating: nil, count: N)
        func  dfs(_ start: Int) -> Int {

            guard start < N else {return 0}

            if let c = memo[start] {
                return c
            }
            var ans = 0

            for possibleStart in start..<N {
                guard let end = possibleSplitPoints[possibleStart] else {
                    continue
                }
                ans = max(ans, 1 + dfs(end + 1))
            }

            memo[start] = ans
            return ans
        }


        return dfs(0)
    }

    private func splitSubstrings(_ s: String, _ limit: Int) -> [Int?] {

        var ans = [Int?](repeating: nil, count: s.count)
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: true, count: s.count), count: s.count)
        for i in 0..<s.count {
            dp[i][i] = true
        }
        let N = s.count
        guard N >= 2 else {
            return ans
        }
        let chars = [Character](s)
        for length in 2...N {
            var left = 0
            while left < N {
                let right = left + length - 1
                guard right < N else {
                    break
                }
                if chars[left] != chars[right] {
                    dp[left][right] = false
                } else {
                    if length <= 3 {
                        dp[left][right] = true
                    } else {
                        dp[left][right] = dp[left + 1][right - 1]
                    }
                }
                if dp[left][right] && length >= limit{
                    if nil == ans[left] {
                        ans[left] = right
                    }
                }
                left += 1
            }
        }
        return ans
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
    func maxPalindromes(_ s: String, _ k: Int) -> Int {
        guard k > 1 else {return s.count}
        let hasher = DoubleStringHasher(s)
        let rHasher = DoubleStringHasher(String(s.reversed()))
        let N = s.count

        func check(_ l: Int, _ r: Int) -> Bool {
            let mr = N - l - 1
            let ml = N - r - 1
            return hasher.getDoubleHash(l, r) == rHasher.getDoubleHash(ml, mr)
        }

        var memo = [Int?](repeating: nil, count: N)

        func dfs(_ start: Int) -> Int {
            guard start < N else {return 0}
            if let v = memo[start] {
                return v
            }
            var sb = 0
            for j in stride(from: start + 1, to: N, by: 1) {
                //直接跳过
                sb = max(sb,dfs(j))

                if j - start + 1 >= k {
                    if check(start, j) {
                        sb = max(sb, 1 + dfs(j + 1))
                    }
                }
            }
            memo[start] = sb
            return sb
        }
        return dfs(0)
    }
}
