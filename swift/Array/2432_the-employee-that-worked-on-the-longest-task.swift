//https://leetcode.com/problems/the-employee-that-worked-on-the-longest-task/
class Solution {
    func hardestWorker(_ n: Int, _ logs: [[Int]]) -> Int {
        var maxCostTime = logs[0][1]
        var ans = logs[0][0]
        let M = logs.count
        for i in 1..<M {
            let cost = logs[i][1] - logs[i - 1][1]
            if cost > maxCostTime {
                maxCostTime = cost
                ans = logs[i][0]
            } else if cost == maxCostTime {
                ans = min(ans, logs[i][0])
            }
        }
        return ans
    }
}