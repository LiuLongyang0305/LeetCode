// https://leetcode.com/problems/minimum-initial-energy-to-finish-tasks/
class Solution {
    func minimumEffort(_ tasks: [[Int]]) -> Int {
        let sortedTasks = tasks.sorted { t1, t2 in
            return t1[0] - t1[1] < t2[0] - t2[1]
        }
        var ans = 0
        var sum = 0
        for task in sortedTasks {
            ans = max(ans, sum + task[1])
            sum += task[0]
        }
        return ans
    }
}