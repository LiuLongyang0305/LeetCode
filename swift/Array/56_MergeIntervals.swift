//https://leetcode.com/problems/merge-intervals/
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else {
            return intervals.isEmpty ? [] : [intervals[0]]
        }
        var  ans = [[Int]]()
        let sortedIntervals = intervals.sorted {$0[0] != $1[0] ? $0[0] < $1[0] : $0[1] < $1[1]}
        ans.append(sortedIntervals[0])
        var index = 0
        for i in 1..<sortedIntervals.count {
            if sortedIntervals[i][0] > ans[index][1] {
                ans.append(sortedIntervals[i])
                index += 1
            } else {
                //ans[index][0] = min(ans[index][0], sortedIntervals[i][0])
                //ans[index][1] = max(ans[index][1], sortedIntervals[i][1])
                ans[index] = [min(ans[index][0], sortedIntervals[i][0]),max(ans[index][1], sortedIntervals[i][1])]
            }
        }
        return ans
    }
}