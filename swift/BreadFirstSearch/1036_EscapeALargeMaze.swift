//https://leetcode.com/problems/escape-a-large-maze/
class Solution {
    private struct Position: Hashable {
        var x: Int
        var y: Int
    }
    typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    private let N = 1_000_000
    
    func isEscapePossible(_ blocked: [[Int]], _ source: [Int], _ target: [Int]) -> Bool {
        guard !blocked.isEmpty else {
            return true
        }
        func valid(_ x: Int, _ y: Int) -> Bool {
            return x >= 0 && y >= 0 && x < N && y < N
        }
        var blockedSets = Set<Position>(blocked.map({ Position(x: $0[0], y: $0[1])}))
        func bfs(_ source: Position, target: Position ) -> Bool {
            var queue = [Position]()
            queue.append(source)
            var visited = Set<Position>()
            visited.insert(source)
            
            while !queue.isEmpty {
                var nextLevel = [Position]()
                for p in queue {
                    for dir in directions {
                        let nextX = p.x + dir.dx
                        let nextY = p.y + dir.dy
                        if valid(nextX, nextY) {
                            let  nextP = Position(x: nextX, y: nextY)
                            guard nextP != target else {
                                return true
                            }
                            if !visited.contains(nextP) && !blockedSets.contains(nextP){
                                nextLevel.append(nextP)
                                visited.insert(nextP)
                                guard visited.count < 2_000_0 else {
                                    return true
                                }
                            }
                        }
                    }
                }
                queue = nextLevel
            }
            return false
        }
        let sourcePosition = Position(x: source[0], y: source[1])
        let targetPosition = Position(x: target[0], y: target[1])
        return bfs(sourcePosition, target: targetPosition) && bfs(targetPosition, target: sourcePosition)
    }
 }