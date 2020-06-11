// https://leetcode.com/problems/minimum-knight-moves/
class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(-1,2),(-2,1),(-2,-1),(-1,-2),(1,-2),(2,-1),(2,1),(1,2)]
    private struct State: Hashable {
        var x: Int
        var y: Int
        var dis: Int
    }
    func minKnightMoves(_ x: Int, _ y: Int) -> Int {
        guard x != 0 || y != 0 else {
            return 0
        }
        let desX = abs(x)
        let desY = abs(y)
        let startState = State(x: 0, y: 0, dis: desY + desX)
        var visited = Set<State>()
        visited.insert(startState)
        var queue = [startState]
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [State]()
            for cur in queue {
                let curDis = cur.dis
                for dir in directions {
                    let nextX = cur.x + dir.dx
                    let nextY = cur.y + dir.dy
                    let nextDis = abs(nextX - desX) + abs(nextY - desY)
                    guard nextDis != 0 else {
                        return depth
                    }
                    guard nextDis <= 4 || nextDis <= curDis else {
                        continue
                    }
                    let nextP = State(x: nextX, y: nextY, dis: nextDis)
                    if !visited.contains(nextP) {
                        visited.insert(nextP)
                        nextLevel.append(nextP)
                    }
                }
            }
            queue = nextLevel
        }
        
        return 0
    }
}
