//https://leetcode.com/problems/number-of-enclaves/
class Solution {
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    typealias Direction = (dx: Int, dy: Int)
    let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    
    func numEnclaves(_ A: [[Int]]) -> Int {
        let row = A.count
        let col = A[0].count
        if row == 1 || col == 1 {
            return 0
        }
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: col), count: row)

        func  valid(_ p: Position) -> Bool {
            return p.x < row && p.x >= 0  && p.y >= 0 && p.y < col && A[p.x][p.y] == 1 && !visited[p.x][p.y]
        }
        
        func dfs(_ p: Position)  {
            for dir in directions {
                let newP = Position(x: p.x + dir.dx, y: p.y + dir.dy)
                if valid(newP) {
                    visited[newP.x][newP.y] = true
                    dfs(newP)
                }
            }
        }
        for i in 0..<col {
            if A[0][i] == 1 && !visited[0][i] {
                visited[0][i] =  true
                dfs(Position(x: 0, y: i))
            }
            if A[row - 1][i] == 1 && !visited[row - 1][i] {
                visited[row - 1][i] =  true
                dfs(Position(x: row - 1, y: i))
            }
        }
        for i in 0..<row {
            if A[i][0] == 1 && !visited[i][0] {
                visited[i][0] = true
                dfs(Position(x: i, y: 0))
            }
            if A[i][col - 1] == 1 && !visited[i][col - 1] {
                visited[i][col - 1] = true
                dfs(Position(x: i, y: col - 1))
            }
        }
        var ans = 0
        for i in 0..<row {
            for j in 0..<col {
                if A[i][j] == 1  && !visited[i][j] {
                    ans += 1
                }
            }
        }
        return ans
    }
}