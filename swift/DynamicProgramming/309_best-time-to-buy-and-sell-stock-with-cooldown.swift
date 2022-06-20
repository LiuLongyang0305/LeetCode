// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let M = prices.count
        var memo = [Int:Int]()
        func dfs(_ idx: Int, _ last: Int, _ hasBought: Int) -> Int {
            guard idx < M else {return 0}
            let key = (idx << 30) | (hasBought << 5) | (idx - last > 1 ? 1 : 0)
            if let v = memo[key] {
                return v
            }
            var ans = Int.min
            //不买不卖
            ans = max(ans, dfs(idx + 1, last, hasBought))
            //买
            if 0 == hasBought && idx - last > 1 {
                ans = max(ans, -prices[idx] + dfs(idx + 1, last, 1))
            }
            //卖
            if 1 == hasBought {
                ans = max(ans, prices[idx] + dfs(idx + 1, idx, 0))
            }
            memo[key] = ans
            return ans
        }

        return dfs(0, -2, 0)
    }
}