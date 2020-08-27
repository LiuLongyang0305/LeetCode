// https://leetcode.com/problems/detect-cycles-in-2d-grid/
class Solution {
    private let  directions = [1,0,-1,0,1]
    func containsCycle(_ grid: [[Character]]) -> Bool {
        var gridCopy = grid.map {$0.map {$0.asciiValue!}}
        let M = grid.count
        let N = grid[0].count
        for r in 0..<M {
            for c in 0..<N {
                if gridCopy[r][c] >= 97 {
                    let target = gridCopy[r][c]
                    var queue = Array<Int>()
                    queue.append(r << 16 | c)
                    while !queue.isEmpty {
                        var nextLevel = [Int]()
                        for p in queue {
                            let x = p >> 16
                            let y = p & 0xffff
                            if gridCopy[x][y] < 97 {
                                return true
                            }
                            gridCopy[x][y] -= 26
                            for j in 0..<4 {
                                let nextX = x + directions[j]
                                let nextY = y + directions[j + 1]
                                if nextX >= 0 && nextX < M && nextY >= 0 && nextY < N && gridCopy[nextX][nextY] == target {
                                    nextLevel.append(nextX << 16 | nextY)
                                }
                            }
                        }
                        queue = nextLevel
                    }
                }
            }
        }
        return false
    }
}