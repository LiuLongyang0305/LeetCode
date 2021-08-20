// https://leetcode.com/problems/maximum-profit-in-job-scheduling/
class Solution {
    private typealias Task = (start:Int,end:Int,profit:Int)
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        guard startTime.count > 1 else {
            return profit.first ?? 0
        }
        var tasks: [Task] = (0..<startTime.count).map {(startTime[$0],endTime[$0],profit[$0])}
        tasks.append((0,0,0))
        tasks.sort { t1, t2 in
            t1.end < t2.end
        }
        let M = tasks.count
        var dp = Array<Int>(repeating: 0, count: M)
        dp[1] = tasks[1].profit
        for idx in 2..<M {
            
            var left = 0
            var right = idx - 1
            while left < right {
                let mid = (left + right + 1) >> 1
                if tasks[mid].end <= tasks[idx].start {
                    left = mid
                } else {
                    right = mid - 1
                }
            }
            
            dp[idx] = max(dp[left] + tasks[idx].profit, dp[idx - 1])
        }
        return dp.last!
    }
}