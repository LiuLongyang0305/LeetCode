// https://leetcode.com/problems/minimum-number-of-days-to-disconnect-island/
class Solution {
    
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    
    func minDays(_ grid: [[Int]]) -> Int {

        let M = grid.count
        let N = grid[0].count
        
        func checkIsOneIsland(_ curGrid: [[Int]]) -> Bool {
            var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
            func dfs(_ row: Int, _ col: Int) {
                for dir in directions {
                    let nextX = row + dir.dx
                    let nextY = col + dir.dy
                    if nextX >= 0 && nextX < M && nextY >= 0 && nextY < N && !visited[nextX][nextY] && curGrid[nextX][nextY] == 1 {
                        visited[nextX][nextY] = true
                        dfs(nextX, nextY)
                    }
                }
            }
            
            var cnt = 0
            for r in 0..<M {
                for c in 0..<N {
                    if curGrid[r][c] == 1 && !visited[r][c] {
                        visited[r][c] = true
                        cnt += 1
                        guard cnt <= 1 else {
                            return false
                        }
                        dfs(r, c)
                    }
                }
            }
            
//            print("grid =\(curGrid) cnt = \(cnt)  true")
            return true
        }
        
        guard checkIsOneIsland(grid) else {
            return 0
        }
        
        var gridCopy = grid

        for r in 0..<M {
            for c in 0..<N {
                if gridCopy[r][c] == 1 {
                    gridCopy[r][c] = 0
                    guard checkIsOneIsland(gridCopy) else {
                        return 1
                    }
                    gridCopy[r][c] = 1
                }
            }
        }
        
        
        return 2
    }
}

