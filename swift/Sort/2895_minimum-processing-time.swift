// https://leetcode.cn/problems/minimum-processing-time/

class Solution {
    func minProcessingTime(_ processorTime: [Int], _ tasks: [Int]) -> Int {
        let sortedProcessorTime = processorTime.sorted()
        let sortedTasks = tasks.sorted { $0 > $1}

        var ans = 0
        for i in 0..<processorTime.count {
            ans = max(ans,sortedProcessorTime[i] + sortedTasks[4 * i])
        }
        return ans
    }
}
