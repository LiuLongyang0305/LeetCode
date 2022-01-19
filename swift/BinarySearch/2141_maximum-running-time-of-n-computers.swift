// https://leetcode.com/problems/maximum-running-time-of-n-computers/
class Solution {
    func maxRunTime(_ n: Int, _ batteries: [Int]) -> Int {
        guard n > 1 else {
            return batteries.reduce(0) { $0 + $1}
        }
        let N = batteries.count
        guard n < N else {
            return batteries.min()!
        }
        var ans = 0
        var left = 0
        var right = batteries.reduce(0) { $0 + $1} / n
        
        func  canFit(_ minutes: Int) -> Bool {
            var curSum = 0
            let target = n * minutes
            for battery in batteries {
                curSum += min(minutes, battery)
            }
            return curSum >= target
        }
        
        
        while left <= right {
            let mid = (right + left) / 2
            if canFit(mid) {
                ans = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }
}