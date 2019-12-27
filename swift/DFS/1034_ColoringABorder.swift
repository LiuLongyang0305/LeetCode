//https://leetcode.com/problems/coloring-a-border/submissions/  
class Solution {
    private let dx = [0,0,1,-1]
    private let dy = [1,-1,0,0]
    func colorBorder(_ grid: [[Int]], _ r0: Int, _ c0: Int, _ color: Int) -> [[Int]] {
        let M = grid.count
        let N = grid[0].count
        var ans = grid
        let targetColor = grid[r0][c0]
        func valid(_ x: Int,_ y: Int) -> Bool {
            return x >= 0 &&  y >= 0 && x < M  &&  y < N
        }
        func isToBeColoured(_ x: Int,_ y: Int)  -> Bool {
            if x == 0 || y == 0 || x == M - 1 || y == N - 1 {
                return  true
            }
            for i in 0..<4 {
                if grid[x  + dx[i]][y + dy[i]] != targetColor {
                    return true
                }
            }
            return false
        }
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
        func dfs(_ x: Int,_ y: Int) {
            if isToBeColoured(x,y) {
                ans[x][y] = color
            }
            for i in 0..<4 {
                let nextX = x + dx[i]
                let nextY = y + dy[i]
                if valid(nextX,nextY) && targetColor ==  grid[nextX][nextY] && !visited[nextX][nextY]{
                    visited[nextX][nextY] = true
                    dfs(nextX, nextY)
                }
            }
        }
        dfs(r0, c0)
        return ans
    }
 }