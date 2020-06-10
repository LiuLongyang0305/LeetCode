// https://leetcode-cn.com/problems/gu-piao-de-zui-da-li-run-lcof/
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        var minPrice = prices[0]
        var maxProfit = 0
        for i in 1..<prices.count {
            let currentPrice = prices[i]
            if currentPrice < minPrice {
                minPrice = prices[i]
            }
            let currentProfit = currentPrice - minPrice
            if currentProfit > maxProfit {
                maxProfit = currentProfit
            }
        }
        return maxProfit
    }
}