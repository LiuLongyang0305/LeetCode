// https://leetcode.cn/problems/4034_minimum-bishop-moves-to-reach-target/
class Solution {
    private typealias Pos = (x:Int,y:Int)
    private typealias Direction = (dx:Int,dy:Int)
    private let dirs:[Direction] = [(-1,-1),(1,1),(1,-1),(-1,1)]
    func minBishopMoves(_ source: [Int], _ target: [Int]) -> Int {

        var sPos: Pos = (source[0],source[1])
        var tPos: Pos = (target[0],target[1])
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)


        func check(_ x: Int, _ y: Int) -> Bool {
            guard x >= 1 && x <= 8 else {return false}
            guard y >= 1 && y <= 8 else {return false}
            guard !visited[x][y] else {return false}
            return true
        }

        func isArrived(_ x:Int, _ y: Int) -> Bool {
            return x == tPos.x && y == tPos.y
        }

        var queue:[Pos] = [sPos]
        visited[sPos.x][sPos.y] = true

        var step = 0
        while !queue.isEmpty {
            var newQueue = [Pos]()
            for (cx,cy) in queue {
                guard !isArrived(cx, cy) else {return step}
                for delta in 1...8 {
                    for (dx,dy) in dirs {
                        let nx = cx + delta * dx
                        let ny = cy + delta * dy
                        guard check(nx, ny) else {
                            continue
                        }
                        visited[nx][ny] = true
                        newQueue.append((nx,ny))
                    }
                }
            }
            step += 1
            queue = newQueue
        }
        return -1
    }
}
