// https://leetcode.com/problems/walls-and-gates/
class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    private let INF = 2147483647
    func wallsAndGates(_ rooms: inout [[Int]]) {
        let M = rooms.count
        guard M > 0 else {
            return
        }
        let N = rooms[0].count
        guard N > 0 else {
            return
        }
        var queue = Array<[Int]>()
        for i in 0..<M {
            for j in 0..<N {
                if rooms[i][j] == 0 {
                    queue.append([i,j])
                }
            }
        }
        var steps = 0
        while !queue.isEmpty {
            steps += 1
            var nextLevel = [[Int]]()
            for p in queue {
                for dir in directions {
                    let nextX = p[0] + dir.dx
                    let nextY = p[1] + dir.dy
                    if nextX < M && nextX >= 0 && nextY < N && nextY >= 0 && rooms[nextX][nextY] == INF {
                        rooms[nextX][nextY] = steps
                        nextLevel.append([nextX,nextY])
                    }
                }
            }
            queue = nextLevel
        }
    }
}

