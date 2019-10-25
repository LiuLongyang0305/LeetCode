//https://leetcode.com/problems/max-area-of-island/
class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        
        var  maxIslandArea = 0
        let rowLength = grid.count
        let colLength = grid[0].count
        //探索记录
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: colLength), count: rowLength)
        
        //四个方向
        let dx = [0,0,1,-1]
        let dy = [1,-1,0,0]
        
        //向陆地四周探索，尽可能发现更多陆地
        var  currentIslandArea = 0
        func dfs(_ x: Int, _ y: Int)  {
            
            currentIslandArea  += 1
            visited[x][y] = true
            
            for i in 0...3 {
                let nextX = x + dx[i]
                let nextY = y + dy[i]
                if  nextX >= 0 && nextX < rowLength && nextY >= 0 && nextY < colLength && grid[nextX][nextY] == 1 && !visited[nextX][nextY] {
                    dfs(nextX, nextY)
                }
            }
        }
        
        for i in 0..<rowLength {
            for j in 0..<colLength {
                //每次发现显得陆地，就向四周探索
                if grid[i][j] == 1 && !visited[i][j] {
                    currentIslandArea = 0
                    dfs(i, j)
                    maxIslandArea = max(maxIslandArea,currentIslandArea)
                }
            }
        }
        
        return maxIslandArea
    }
}