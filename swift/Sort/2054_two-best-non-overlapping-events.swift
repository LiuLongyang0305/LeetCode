// https://leetcode.com/problems/two-best-non-overlapping-events/
class Solution {
    func maxTwoEvents(_ events: [[Int]]) -> Int {
        let N = events.count
        var ans = 0
        let sortedIndicesByStartTime = (0..<N).sorted { i, j in
            events[i][0] < events[j][0]
        }
        let sortedIndicesByEndTime = (0..<N).sorted { i, j in
            events[i][1] < events[j][1]
        }
        var maxEventsValue = 0
        var j = 0
        for idx in sortedIndicesByStartTime {
            let v = events[idx][2]
            let s = events[idx][0]
            while j < N && events[sortedIndicesByEndTime[j]][1] < s  {
                maxEventsValue = max(maxEventsValue, events[sortedIndicesByEndTime[j]][2])
                j += 1
            }
            ans = max(ans, v + maxEventsValue)
        }
        return ans
    }
}