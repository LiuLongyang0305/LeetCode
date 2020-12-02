// https://leetcode-cn.com/problems/robot-in-a-grid-lcci/
class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(1,0),(0,1)]
    func pathWithObstacles(_ obstacleGrid: [[Int]]) -> [[Int]] {
        guard obstacleGrid[0][0] == 0 else {
            return []
        }
        let M = obstacleGrid.count
        let N = obstacleGrid[0].count
        guard M * N > 1 else {
            return [[0,0]]
        }
        var queue = [[0]]
        let target = (M - 1) << 8 | (N - 1)
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
        visited[0][0] = true
        while !queue.isEmpty {
            var nextLevel = [[Int]]()
            for path in queue {
                let last = path.last!
                let x0 = last >> 8
                let y0 = last & 0xff
                for (dx,dy) in directions {
                    let x1 = x0 + dx
                    let y1 = y0 + dy
                    guard x1 >= 0 && x1 < M && y1 >= 0 && y1 < N && !visited[x1][y1] && obstacleGrid[x1][y1] == 0 else {
                        continue
                    }
                    visited[x1][y1] = true
                    let newP = x1 << 8 | y1
                    guard newP != target else {
                        var targetPath = path.map {[$0 >> 8, $0 & 0xff]}
                        targetPath.append([x1,y1])
                        return targetPath
                    }
                    nextLevel.append(path + [newP])
                }
            }
            queue = nextLevel
        }
        return []
    }
}
