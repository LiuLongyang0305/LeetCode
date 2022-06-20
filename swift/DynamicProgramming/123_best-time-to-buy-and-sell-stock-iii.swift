// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/
/**
 - state = 0: 没有买进任何东西
 - state = 1: 买入一次
 - satae = 2: 卖出一次
 - state = 3: 买入两次
 - state = 4: 卖出两次
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let N = prices.count
        var memo = [Int:Int]()

        func dfs(_ idx: Int, _ lastState: Int) -> Int {
            guard lastState < 4 else {return 0}
            guard idx < N else {return 0}

            let key = (lastState << 20) | idx
            guard nil == memo[key] else {return memo[key] ?? 0}
            var ans = Int.min

            if 0 == lastState  {
                ans = max(ans, -prices[idx] +  dfs(idx + 1, 1),dfs(idx + 1, 0))
            } else if 1 == lastState  {
                ans = max(ans, prices[idx] + dfs(idx + 1, 2), dfs(idx + 1, 1),dfs(idx + 1, 3))
            }  else if 2 == lastState {
                ans = max(ans, dfs(idx + 1, 2), -prices[idx] + dfs(idx + 1, 3))
            } else if 3 == lastState {
                ans = max(ans, dfs(idx + 1, 3),prices[idx] + dfs(idx + 1, 4))
            }
            memo[key] = ans
            return ans
        }

        return max(0,dfs(0, 0))
    }
}