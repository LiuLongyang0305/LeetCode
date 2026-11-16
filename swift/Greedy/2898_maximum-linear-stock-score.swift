// https://leetcode.cn/problems/maximum-linear-stock-score/
class Solution {
    func maxScore(_ prices: [Int]) -> Int {
        var sum = [Int:Int]()
        for (i,v) in prices.enumerated() {
            sum[v - i,default: 0] += v
        }
        return sum.values.max() ?? 0
    }
}
