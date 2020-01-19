// https://leetcode.com/problems/minimum-number-of-taps-to-open-to-water-a-garden/
class Solution {
    
    func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
        var dp = Array<Int>(repeating: Int.max, count: n + 1)
        dp[0] = 0
        for i in 0...n {
            if ranges[i] > 0 {
                let left  = max(i - ranges[i], 0)
                let right = min(i + ranges[i],n)
                if dp[left] != Int.max {
                    for j in (left + 1)...right {
                        dp[j] = min(dp[j], dp[left] + 1)
                    }
                }
            }
        }
        return dp[n] ==  Int.max ? -1 : dp[n]
    }
 }