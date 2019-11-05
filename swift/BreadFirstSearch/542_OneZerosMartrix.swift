//https://leetcode.com/problems/01-matrix/
class Solution {
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        let row = matrix.count
        let col = matrix[0].count
        var visited = Set<[Int]>()
        var ans = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: col), count: row)
        let dx = [0,0,1,-1]
        let dy = [1,-1,0,0]
        func valid(_ x: Int, _ y: Int) -> Bool {
            return x >= 0 && x < row && y >= 0 && y < col
        }
        func bfs(_ x: Int , _ y: Int)  -> Int {
            var nodes = [[Int]]()
            nodes.append([x,y])
            var depth = 0
            while !nodes.isEmpty {
                depth += 1
                let length = nodes.count
                for _ in 0..<length{
                    let p =  nodes.removeFirst()
                    for i in 0..<4 {
                        let nextX = p[0] + dx[i]
                        let nextY = p[1] + dy[i]
                        if valid(nextX, nextY){
                            if matrix[nextX][nextY] == 0 {
                                return depth
                            }
                            if !visited.contains([nextX,nextY]) {
                                nodes.append([nextX,nextY])
                                visited.insert([nextX,nextY])
                            }
                        }
                    }
                }
            }
            return 0
        }
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == 1 {
                    visited =  [[i,j]]
                    ans[i][j] = bfs(i, j)
                }
            }
        }
        return ans
    }
}