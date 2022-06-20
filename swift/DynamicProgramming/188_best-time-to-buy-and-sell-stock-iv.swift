 // https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/
/**
 1. 当前考虑的idx
 2. 剩余可以交易次数
 3. 当前手里股票状态：1表示买入未卖出，0表示没有可以卖出的股票
 */
class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {

        let M = prices.count

        var memo = [Int:Int]()
        func dfs(_ idx: Int, _ remainTransitionTime: Int, _ hasBought:Int) -> Int {
            guard remainTransitionTime > 0 else {return 0}
            guard idx < M else {return 0}
            let key = (remainTransitionTime << 20 ) | (idx << 10) | hasBought
            guard nil == memo[key] else {return memo[key] ?? 0}
            var ans = Int.min
            //不买入不卖出
            ans = max(ans, dfs(idx + 1, remainTransitionTime, hasBought))
            //买入
            if 0 == hasBought  {
                ans = max(ans, -prices[idx] + dfs(idx + 1, remainTransitionTime, 1))
            }
            //仅卖出
            if 1 == hasBought {
                ans = max(ans, prices[idx] + dfs(idx + 1, remainTransitionTime - 1, 0))
            }

            //先卖出后买入
            if 1 == hasBought {
                ans = max(ans, dfs(idx + 1, remainTransitionTime - 1, 1))
            }
            memo[key] = ans
            return ans
        }
        return dfs(0, k, 0)
    }
}


class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        if prices.count == 0 { return 0 }

        let K: Int = k
        let count = prices.count

        var dp: [[[Int]]] = [[[Int]]](
            repeating: [[Int]](
                repeating: [Int](repeating: 0, count: 2), 
                count: K+1
            ), 
            count: count
        )

        for i in 0..<count {
            var k = K
            while k >= 1 {
                if i-1 == -1 {
                    dp[0][k][0] = 0
                    dp[0][k][1] = -prices[0]
                    k = k - 1
                    continue
                }
                dp[i][k][0] = max(
                    dp[i-1][k][0], 
                    dp[i-1][k][1] + prices[i]
                )

                dp[i][k][1] = max(
                    dp[i-1][k][1],
                    dp[i-1][k-1][0] - prices[i]
                )

                k = k - 1
            }
        }
        return dp[count-1][K][0]
    }
}