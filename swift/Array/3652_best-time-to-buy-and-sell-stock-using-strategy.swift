// https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-using-strategy/
class Solution {
    func maxProfit(_ prices: [Int], _ strategy: [Int], _ k: Int) -> Int {
        let N = prices.count
        var preffix = [Int](repeating: 0, count: N + 1)
        var preffix2 = [Int](repeating: 0, count: N + 1)
        for i in 1...N {
            preffix[i] = preffix[i - 1] + prices[i - 1] * strategy[i - 1]
            preffix2[i] = preffix2[i - 1] + prices[i - 1]
        }
        var sb = preffix.last!

        for l in 0..<N {
           let r = l + k - 1
            guard r < N else {break}
            sb = max(sb,preffix[l] + preffix.last! - preffix[r + 1] + preffix2[r + 1] - preffix2[l + k / 2])
        }


        return sb
    }
}
