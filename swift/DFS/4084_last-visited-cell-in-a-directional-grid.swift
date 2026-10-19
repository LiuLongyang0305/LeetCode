    // https://leetcode.cn/problems/last-visited-cell-in-a-directional-grid/
    class Solution {
        let directions:[Character:(Int,Int)] = ["L":(0,-1),"R":(0,1),"U": (-1,0),"D":(1,0)]
        func lastVisitedCell(_ grid: [[Character]]) -> [Int] {

            let M = grid.count
            let N = grid[0].count

            var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)
            var (lastX,lastY) = (0,0)
            visited[0][0] = true
            func dfs(_ x: Int, _ y: Int){
                let (dx,dy) = directions[grid[x][y]]!
                let nx = x + dx
                let ny = y + dy
                guard nx >= 0 && nx < M && ny >= 0 && ny < N && !visited[nx][ny] else {return}
                visited[nx][ny] = true
                (lastX,lastY) = (nx,ny)
                dfs(nx,ny)
            }

            dfs(0, 0)
            return [lastX,lastY]
        }
    }
