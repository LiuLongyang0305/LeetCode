// https://leetcode.com/problems/paint-house/
class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        var preR = 0, curR = 0
        var preB = 0, curB = 0
        var preG = 0, curG = 0
        for cost in costs {
            curR = min(preB, preG) + cost[0]
            curB = min(preG, preR) + cost[1]
            curG = min(preB, preR) + cost[2]
            
            preR = curR
            preG = curG
            preB = curB
        }
        return min(curG, curB, curR)
    }
}
