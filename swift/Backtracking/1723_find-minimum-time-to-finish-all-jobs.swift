// https://leetcode.com/problems/find-minimum-time-to-finish-all-jobs/
class Solution {
    func minimumTimeRequired(_ jobs: [Int], _ k: Int) -> Int {
        let sortedJobs = jobs.sorted {$0 > $1}
        var low = 0
        var high = jobs.reduce(0) {$0 + $1}
        while low < high {
            let mid = (low + high) >> 1
            if check(sortedJobs, k,mid) {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return low
    }
    private func check(_ sortedJobs: [Int],_ k: Int, _ limit: Int) -> Bool {
        var workLoads = Array<Int>(repeating: 0, count: k)
        return backtrack(sortedJobs, &workLoads, 0, limit)
    }
    private func backtrack(_ sortedJobs: [Int],_ workLoads: inout [Int], _ idx: Int,_ limit: Int) -> Bool {
        guard idx < sortedJobs.count else {
            return true
        }
        let cur = sortedJobs[idx]
        for workLoadIdx in 0..<workLoads.count {
            if workLoads[workLoadIdx] + cur <= limit {
                workLoads[workLoadIdx] += cur
                if backtrack(sortedJobs, &workLoads, idx + 1, limit) {
                    return true
                }
                workLoads[workLoadIdx] -= cur
            }
            if workLoads[workLoadIdx] == 0 || workLoads[workLoadIdx] + cur == limit {
                break
            }
        }
        return false
    }
}