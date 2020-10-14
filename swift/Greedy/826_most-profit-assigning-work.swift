// https://leetcode.com/problems/most-profit-assigning-work/
class Solution {
    func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
        let sortedTasks = zip(difficulty, profit).sorted { $0.1 > $1.1 }
        let sortedWorkers = worker.sorted { $0 > $1}
        var ans = 0
        var i = 0
        for (dif,pro) in sortedTasks {
            var cnt = 0
            while i < worker.count && sortedWorkers[i] >= dif {
                cnt += 1
                i += 1
            }
            ans += cnt * pro
        }
        return ans
    }
}