// https://leetcode-cn.com/problems/coin-lcci/
class Solution {
    private let coins = [1,5,10,25]
    func waysToChange(_ n: Int) -> Int {
        var dp = Array<Int>(repeating: 0, count: n + 1)
        dp[0] = 1
        for coin in coins {
            guard coin <= n else {
                break
            }
            for x in coin...n {
                dp[x] += dp[x - coin]
                dp[x] %= 1_000_000_007
            }
        }
        return dp[n]
    }
}