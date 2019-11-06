//https://leetcode.com/problems/shortest-path-to-get-all-keys/
class Solution {
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    struct State: Hashable {
        var pos: Position
        var withKeys: Set<Character>
    }
    
    typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    
    func shortestPathAllKeys(_ grid: [String]) -> Int {
        
        let gridCopy = grid.map{ Array<Character>($0)}
        var row = gridCopy.count
        var col = gridCopy[0].count
        var startPosition = Position(x: -1, y: -1)
        var walls = Set<Position>()
        var keys = Set<Position>()
        var locks = Set<Position>()
        
        for i in 0..<row {
            for j in 0..<col {
                if gridCopy[i][j] == "@" {
                    startPosition.x = i
                    startPosition.y = j
                } else if gridCopy[i][j] == "#" {
                    walls.insert(Position(x: i, y: j))
                } else if gridCopy[i][j].isLowercase {
                    keys.insert(Position(x: i, y: j))
                } else if gridCopy[i][j].isUppercase {
                    locks.insert(Position(x: i, y: j))
                }
            }
        }
        //用以判断是否找到了所有的钥匙
        let keysCount  = keys.count
        //判断当前位置是不是墙
        func valid(_ p: Position) -> Bool {
            return p.x >= 0 && p.x < row && p.y >= 0 && p.y < col && !walls.contains(p)
        }
        //BFS
        let startState = State(pos: startPosition, withKeys: [])
        var visited = Set<State>()
        visited.insert(startState)
        var potentialStates = [State]()
        potentialStates.append(startState)
        var depth = 0
        
        while !potentialStates.isEmpty {
            depth += 1
            let length = potentialStates.count
            for _ in 0..<length {
                var s = potentialStates.removeFirst()
                
                if keys.contains(s.pos) {
                    s.withKeys.insert(gridCopy[s.pos.x][s.pos.y])
                }
                let p = s.pos
                
                for dir in directions {
                    let nextP = Position(x: p.x + dir.dx, y: p.y + dir.dy)
                    if valid(nextP) {
                        //下一个位置有钥匙，则提前判断看看能否退出
                        if keys.contains(nextP) {
                            var  currentKeys = s.withKeys
                            currentKeys.insert(gridCopy[nextP.x][nextP.y])
                            if currentKeys.count == keysCount {
                                return depth
                            }
                        }

                        //下一层可能遍历的节点
                        if !locks.contains(nextP) || s.withKeys.contains(gridCopy[nextP.x][nextP.y].lowercased().first!) {
                            s.pos = nextP
                            if !visited.contains(s) {
                                potentialStates.append(s)
                                visited.insert(s)
                            }
                        }
                    }
                }
            }
        }
        return -1
    }
}
