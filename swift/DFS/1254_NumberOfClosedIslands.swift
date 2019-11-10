//https://leetcode.com/problems/number-of-closed-islands/
class Solution {
    typealias Direction = (dx: Int, dy: Int)
    struct Position:  Hashable {
        var x: Int
        var y: Int
    }
    let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func closedIsland(_ grid: [[Int]]) -> Int {
        let row = grid.count
        let col = grid[0].count
        guard row > 2 && col > 2 else {
            return 0
        }
        var visited = Set<Position>()
        func valid(_ p: Position) -> Bool {
            return p.x >= 0 && p.x < row && p.y >= 0 && p.y < col && grid[p.x][p.y] == 0 && !visited.contains(p)
        }
        func dfs(_ p: Position) {
            for dir in directions {
                let nextP = Position(x: p.x + dir.dx, y: p.y + dir.dy)
                if valid(nextP) {
                    visited.insert(nextP)
                    dfs(nextP)
                }
            }
        }
        for i in 0..<col {
            if grid[0][i] == 0 {
                let p = Position(x: 0, y: i)
                if valid(p) {
                    visited.insert(p)
                    dfs(p)
                }
            }
            if grid[row - 1][i] == 0 {
                let p = Position(x: row - 1, y: i)
                if valid(p) {
                    visited.insert(p)
                    dfs(p)
                }
            }
        }
        for i in 0..<row{
            if grid[i][0] == 0 {
                let p = Position(x: i, y: 0)
                if valid(p) {
                    visited.insert(p)
                    dfs(p)
                }
            }
            if grid[i][col - 1] == 0 {
                let p = Position(x: i, y: col - 1)
                if valid(p) {
                    visited.insert(p)
                    dfs(p)
                }
            }
        }
    
        var ans = 0
        for i in 1..<row - 1 {
            for j in 1..<col - 1 {
                if grid[i][j]  == 0 {
                    let  p = Position(x: i, y: j)
                    if  valid(p) {
                        visited.insert(p)
                        ans += 1
                        dfs(p)
                    }
                }
            }
        }
        return ans
    }
}