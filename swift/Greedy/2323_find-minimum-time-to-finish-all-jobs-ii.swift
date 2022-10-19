// https://leetcode.com/problems/find-minimum-time-to-finish-all-jobs-ii/
class Solution {
    func minimumTime(_ jobs: [Int], _ workers: [Int]) -> Int {
        let sortedJobs = jobs.sorted()
        let sortedWorkers = workers.sorted()
        let N = sortedJobs.count
        var ans = Int.min
        for i in 0..<N {
            let t = sortedJobs[i] / sortedWorkers[i]
            let mod = sortedJobs[i] % sortedWorkers[i]
            ans = max(ans, t + (mod == 0 ? 0 : 1))
        }
        return ans
    }
}