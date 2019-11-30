//https://leetcode.com/problems/remove-interval/ 
class Solution {
    func removeInterval(_ intervals: [[Int]], _ toBeRemoved: [Int]) -> [[Int]] {
        guard toBeRemoved[0] <= intervals.last![1] && toBeRemoved[1] >= intervals.first![0] else {
            return intervals
        }
        var sortedIntervals = [[Int]]()
        
        let start = toBeRemoved[0]
        let end = toBeRemoved[1]
        
        for interval in intervals {
            if interval[1] <= start || interval[0] >= end{
                sortedIntervals.append(interval)
                continue
            }
            if start <= interval[0] && end >= interval[1] {
                continue
            }
            if start >= interval[0]  &&  end <= interval[1] {
                if interval[0] != start {
                    sortedIntervals.append([interval[0],start])
                }
                if interval[1] != end {
                    sortedIntervals.append([end,interval[1]])
                }
                continue
            }
            if start > interval[0] && end >= interval[1]  {
                sortedIntervals.append([interval[0],start])
                continue
            }
            if start <= interval[0] && end < interval[1] {
                sortedIntervals.append([end,interval[1]])
            }
        }
        return sortedIntervals
    }
 }