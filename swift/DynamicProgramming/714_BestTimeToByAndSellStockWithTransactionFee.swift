//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var empty = 0
        var hold = -prices[0]
        for i in 1..<prices.count {
            (empty,hold) = (max(empty, hold + prices[i] - fee),max(empty - prices[i], hold))
        }
        return max(hold, empty)
    }
}

class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let N = prices.count
        var memo = [Int:Int]()
        func dfs(_ idx: Int, _ hasBought: Int) -> Int {
            guard idx < N  else {return 0}
            let key = idx << 20 | hasBought
            if let v = memo[key] {
                return v
            }
            var ans = Int.min
            //不买入不卖出
            ans = max(ans, dfs(idx + 1, hasBought))
            //买入
            if 0 == hasBought {
                ans = max(ans, -prices[idx] - fee + dfs(idx + 1, 1))
            }

            //卖出
            if 1 == hasBought {
                ans = max(ans, prices[idx] + dfs(idx + 1, 0))
            }
            //先卖出后买入
            if 1 == hasBought {
                ans = max(ans, -fee + dfs(idx + 1, 1) )
            }
            memo[key] = ans
            return ans
        }
        return dfs(0, 0)
    }
}