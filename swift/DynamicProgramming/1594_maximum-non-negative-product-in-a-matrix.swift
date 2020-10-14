// https://leetcode.com/problems/maximum-non-negative-product-in-a-matrix/
class Solution {
    private let MOD = 1_000_000_007
    private typealias Answer = (min:Int,max:Int)
    func maxProductPath(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else {
            return -1
        }
        guard !grid[0].isEmpty else {
            return -1
        }
        let M = grid.count
        let N = grid[0].count
        guard M * N > 1 else {
            return grid[0][0] >= 0 ? grid[0][0] : -1
        }
        var dp: [[Answer]] = Array<Array<Answer>>(repeating: Array<Answer>(repeating: (Int.max,Int.min), count: N), count: M)
        dp[0][0] = (grid[0][0],grid[0][0])
        if M > 1 {
            for r in 1..<M {
                let t = grid[r][0] * dp[r - 1][0].max
                dp[r][0] = (t,t)
            }
        }
        if N > 1 {
            for c in 1..<N {
                let t = grid[0][c] * dp[0][c - 1].min
                dp[0][c] = (t,t)
            }
        }
        guard M > 1 && N > 1 else {
            return dp[M - 1][N - 1].max >= 0 ? dp[M - 1][N - 1].max % MOD : -1
        }
        for r in 1..<M {
            for c in 1..<N {
                let ans = [grid[r][c] * dp[r - 1][c].min, grid[r][c] * dp[r - 1][c].max, grid[r][c] * dp[r][c - 1].min, grid[r][c] * dp[r][c - 1].max]
                dp[r][c] = (ans.min()!,ans.max()!)
            }
        }
        return dp[M - 1][N - 1].max >= 0 ? dp[M - 1][N - 1].max % MOD : -1
    }
}

let grid = [[1,-2,1],[1,-2,1],[3,-4,1]]
Solution().maxProductPath(grid)

