 // https://leetcode.com/problems/number-of-increasing-paths-in-a-grid/
class Solution {
    private let MOD = 1_000_000_007
    private typealias Direction = (dx:Int,dy:Int)
    private let dirs:[Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func countPaths(_ grid: [[Int]]) -> Int {
        let M = grid.count
        let N = grid[0].count
        var dp = [[Int]](repeating: [Int](repeating: -1, count: N), count: M)



        func dfs(_ x: Int, _ y: Int) -> Int {
            guard -1 == dp[x][y] else {
                return dp[x][y]
            }
            var ans = 1
            for (dx,dy) in dirs {
                let nx = x + dx
                let ny = y + dy
                guard nx >= 0 && nx < M && ny >= 0 && ny < N && grid[nx][ny] > grid[x][y] else {continue}
                ans += dfs(nx, ny)
                ans %= MOD
            }
            dp[x][y] = ans
            return ans
        }

        var ans = 0
        for x in 0..<M {
            for y in 0..<N {
                ans += dfs(x, y)
                ans %= MOD
            }
        }
        return ans
    }
}
