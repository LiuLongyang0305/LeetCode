//https://leetcode.com/problems/minimum-cost-to-reach-every-position
class Solution {
    func minCosts(_ cost: [Int]) -> [Int] {
        var ans = cost
        for i in 1..<cost.count {
            ans[i] = min(ans[i - 1],cost[i])
        }
        return ans
    }
}