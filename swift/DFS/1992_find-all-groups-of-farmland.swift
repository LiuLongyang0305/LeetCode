// https://leetcode.com/problems/find-all-groups-of-farmland/
class Solution {
    private let directions = [(0,1),(0,-1),(-1,0),(1,0)]
    func findFarmland(_ land: [[Int]]) -> [[Int]] {
        let M = land.count
        let N = land[0].count
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
        
        
        var deltaX = -1
        var deltaY = -1
        
        
        func dfs(_ r: Int, _ c: Int, _ leftUpR: Int, _ leftUpC: Int) {
            deltaX = max(deltaX, r - leftUpR)
            deltaY = max(deltaY, c - leftUpC)
            for (dx,dy) in directions {
                let nx = r + dx
                let ny = c + dy
                guard nx >= 0 && nx < M && ny >= 0 && ny < N && land[nx][ny] == 1 && !visited[nx][ny] else {
                    continue
                }
                visited[nx][ny] = true
                dfs(nx, ny, leftUpR,leftUpC)
            }
        }
        
        
        var ans = [[Int]]()
        
        for r in 0..<M {
            for c in 0..<N {
                if land[r][c] == 1 && !visited[r][c] {
                    deltaY = -1
                    deltaX = -1
                    visited[r][c] = true
                    dfs(r, c, r, c)
                    ans.append([r,c,r + deltaX, c + deltaY])

                }
            }
        }
        return ans
    }
}

