// https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/
class Solution {
    func maxValue(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty  || grid[0].isEmpty else {
            return 0
        }
        let M = grid.count
        let N = grid[0].count
        guard M > 1 || N > 1 else {
            return grid[0][0]
        }
        var dp = grid
        for r in 0..<M {
            for c  in 0..<N {
                if r > 0 || c > 0 {
                    if r > 0 {
                        dp[r][c] = grid[r][c] + dp[r - 1][c]
                    }
                    if c > 0 {
                        dp[r][c] = max(dp[r][c], dp[r][c - 1] + grid[r][c])
                    }
                }
            }
        }
        return dp[M - 1][N - 1]
    }
}