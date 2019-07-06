class Q122_Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        var maxProfit = 0
        var dp : [[Int]] = Array<[Int]>(repeating: Array<Int>(repeating: 0, count: 2), count: prices.count)
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        for i in 1..<prices.count {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
            if dp[i][0] > maxProfit {
                maxProfit = dp[i][0]
            }
            if dp[i][1] > maxProfit {
                maxProfit = dp[i][1]
            }
        }
        return maxProfit
    }
}