//https://leetcode.com/problems/two-city-scheduling/
class Solution {
    
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let N = costs.count / 2
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N + 1), count: N + 1)
        for i in 1...N {
            dp[i][0] = dp[i - 1][0] + costs[i - 1][0]
        }
        
        for j in 1...N {
            dp[0][j] = dp[0][j - 1] + costs[j - 1][1]
        }
        print(dp)
        for i in 1...N {
            for j in 1...N {
                dp[i][j] = min(dp[i - 1][j] + costs[i + j - 1][0], dp[i][j - 1] + costs[i + j - 1][1])
            }
        }
        print(dp)
        return dp[N][N]
    }
}