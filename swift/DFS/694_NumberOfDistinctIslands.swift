// https://leetcode.com/problems/number-of-distinct-islands/
class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty && !grid[0].isEmpty else {
            return 0
        }
        
        var islands = Set<[[Int]]>()
        let M = grid.count
        let N = grid[0].count
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
        
        func dfs(_ x: Int, _ y: Int,_ curentLand: inout [[Int]]) {
            for dir in directions {
                let nextX = x + dir.dx
                let nextY = y + dir.dy
                
                if nextX < M && nextX >= 0 && nextY < N && nextY >= 0 && grid[nextX][nextY] == 1 && !visited[nextX][nextY] {
                    visited[nextX][nextY] = true
                    curentLand.append([nextX,nextY])
                    dfs(nextX, nextY, &curentLand)
                }
            }
        }
        
        for i in 0..<M {
            for j in 0..<N {
                if grid[i][j] == 1 && !visited[i][j] {
                    visited[i][j] = true
                    var currentLand: [[Int]] = [[i,j]]
                    dfs(i, j, &currentLand)
                    
                    currentLand.sort { (p1, p2) -> Bool in
                        if p1[0] == p2[0] {
                            return p1[1] < p2[1]
                        }
                        return p1[0] < p2[0]
                    }
                    let startP = currentLand[0]
                    
                    islands.insert(currentLand.map({ [$0[0] - startP[0],$0[1] - startP[1]] }))
                    
                }
            }
        }
        return islands.count
    }
}