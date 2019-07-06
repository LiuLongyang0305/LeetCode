//https://leetcode.com/problems/non-overlapping-intervals/
class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard !intervals.isEmpty else {
            return 0
        }
        var ans = 0
        let sortedIntervals = intervals.sorted { (interval1, interval2) -> Bool in
            interval1[1] < interval2[1]
        }
        var targetPosition = sortedIntervals[0][1]
        for i in 1..<sortedIntervals.count {
            let interval = sortedIntervals[i]
            if interval[0] < targetPosition  {
                ans += 1
            } else {
                targetPosition = interval[1]
            }
        }
        return ans
    }
}