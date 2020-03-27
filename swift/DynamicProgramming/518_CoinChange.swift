// https://leetcode.com/problems/coin-change-2/
class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        let sortedCions = coins.sorted()
        var dp = Array<Int>(repeating: 0, count: amount + 1)
        dp[0] = 1
        for coin in sortedCions  {
            guard coin <= amount else {
                break
            }
            for x in coin...amount {
                dp[x] += dp[x - coin]
            }
        }

        return dp[amount]
    }
}