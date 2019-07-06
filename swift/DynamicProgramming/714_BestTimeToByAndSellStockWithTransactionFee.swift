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