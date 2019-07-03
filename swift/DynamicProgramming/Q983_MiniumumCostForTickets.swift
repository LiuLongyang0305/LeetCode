//https://leetcode.com/problems/minimum-cost-for-tickets/
class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var dp = Array<Int>(repeating: 0, count: 366)
        for day in days {
            dp[day] = costs[0]
        }
        
        for i  in 1...days.last! {
            if dp[i] == 0 {
                dp[i] = dp[i - 1]
            } else {
                dp[i] = dp[i - 1] + costs[0]
                var j = max(0, i - 7)
                dp[i] = min(dp[i], dp[j] + costs[1])
                j = max(0, i - 30)
                dp[i] = min(dp[i], dp[j] + costs[2])
            }
        }
        return dp[days.last!]
    }
}