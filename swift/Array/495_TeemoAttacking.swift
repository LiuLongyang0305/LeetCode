//https://leetcode.com/problems/teemo-attacking/
class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        guard timeSeries.count > 1 else {
            return timeSeries.isEmpty ? 0 : duration
        }
        var ans = duration
        for i in 1..<timeSeries.count {
            ans += min(duration, timeSeries[i]  - timeSeries[i - 1])
        }
        return ans
    }
}