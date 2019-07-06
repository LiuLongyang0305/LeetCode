//https://leetcode.com/problems/minimum-path-sum/
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var dp = grid
        let rowSize = grid.count
        let colSize = grid[0].count
        for i in 1..<rowSize {
            dp[i][0] += dp[i - 1][0]
        }
        for i in 1..<colSize {
            dp[0][i] += dp[0][i - 1]
        }
        for i in 1..<rowSize {
            for j in 1..<colSize {
                dp[i][j] += min(dp[i - 1][j], dp[i][j - 1])
            }
        }
        return dp[rowSize - 1][colSize - 1]
    }
}
Solution().minPathSum([[1,3,1],[1,5,1],[4,2,1]])