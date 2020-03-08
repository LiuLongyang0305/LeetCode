// https://leetcode.com/problems/time-needed-to-inform-all-employees/
class Solution {
    func numOfMinutes(_ n: Int, _ headID: Int, _ managers: [Int], _ informTime: [Int]) -> Int {
        var tree = [Int: [Int]]()
        for i in 0..<n {
            if nil == tree[managers[i]] {
                tree[managers[i]] = [i]
            } else {
                tree[managers[i]]?.append(i)
            }
        }
        var maxNeedTime = Int.min
        func dfs(_ manager: Int, _ currentTime: Int) {
            guard let employees = tree[manager] else {
                maxNeedTime = max(currentTime, maxNeedTime)
                return
            }
            for employee in employees {
                dfs(employee, currentTime + informTime[manager])
            }
        }
        dfs(headID, 0)
        return maxNeedTime
    }
 }
 