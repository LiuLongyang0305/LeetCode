// https://leetcode.com/problems/valid-permutations-for-di-sequence/
class Solution {
    func numPermsDISequence(_ s: String) -> Int {
        let n = s.count,mod = 1_000_000_007
        let oeders = [Character](s)
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: n + 1), count: n + 1)
        for j in 0...n {
            dp[0][j] = 1
        }
        for i in 0..<n {
            if oeders[i] == "I" {
                var j = 0
                var cur = 0
                while j < n - i {
                    cur = (cur + dp[i][j]) % mod
                    dp[i + 1][j] = cur
                    j += 1
                }
            } else {
                var j = n - i - 1
                var cur = 0
                while j >= 0 {
                    cur = (cur + dp[i][j + 1]) % mod
                    dp[i + 1][j] = cur
                    j -= 1
                }
            }
        }
        return dp[n][0]
    }
}

