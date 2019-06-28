//https://leetcode.com/problems/min-cost-climbing-stairs/
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var currentMinCost = Array<Int>(repeating: 0, count: 2)
        for i in 0..<cost.count {
            let lastStepMinCost = currentMinCost[0] < currentMinCost[1] ? currentMinCost[0] : currentMinCost[1]
            currentMinCost[1] = currentMinCost[0]
            currentMinCost[0] = lastStepMinCost + cost[i]
        }
        return currentMinCost[0] < currentMinCost[1] ? currentMinCost[0] : currentMinCost[1]
    }
}