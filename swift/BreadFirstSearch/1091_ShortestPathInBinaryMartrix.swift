//https://leetcode.com/problems/shortest-path-in-binary-matrix/submissions/
class Solution {
    typealias Direction = (dx: Int, dy: Int)
    typealias Position = (x: Int, y:  Int)
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let N = grid.count
        guard grid[0][0] == 0 && grid[N - 1][N - 1]  == 0 else {
            return -1
        }
        guard N != 1 else {
            return 1
        }
        func valid(_ x: Int, _ y: Int)  -> Bool {
            return x >= 0 &&  x < N && y >= 0  && y < N
        }
        let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0),(-1,-1),(-1,1),(1,-1),(1,1)]
        var positions = [Position]()
        positions.append((0,0))
        var visited = Set<[Int]>()
        visited.insert([0,0])
        var depth = 0
        while !positions.isEmpty {
            let length = positions.count
            depth += 1
            for _ in 0..<length {
                let p = positions.removeFirst()
                for dir in directions {
                    let x = p.x + dir.dx
                    let y = p.y + dir.dy
                    if  valid(x, y) && grid[x][y] == 0 && !visited.contains([x,y]) {
                        if x == N - 1 && y == N - 1 {
                            return depth + 1
                        }
                        visited.insert([x,y])
                        positions.append((x,y))
                    }
                }
            }
        }
        return -1
    }
}