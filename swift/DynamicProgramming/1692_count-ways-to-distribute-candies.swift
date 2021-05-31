// https://leetcode.com/problems/count-ways-to-distribute-candies/
class Solution {
    private let MOD = 1_000_000_007
    func waysToDistribute(_ n: Int, _ k: Int) -> Int {
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: k + 1), count: n + 1)
        var i = 1
        while i <= n {
            var j = 1
            while j <= min(i, k) {
                if j == 1 {
                    dp[i][j] = 1
                } else {
                    dp[i][j] = (dp[i - 1][j] * j + dp[i - 1][j - 1]) % MOD
                }
                j += 1
            }
            i += 1
        }
        return dp[n][k]
    }
}
