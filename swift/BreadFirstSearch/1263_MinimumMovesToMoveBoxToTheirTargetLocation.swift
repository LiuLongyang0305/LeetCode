//https://leetcode.com/problems/minimum-moves-to-move-a-box-to-their-target-location/
 class Solution {
    private struct Position: Hashable {
        var x: Int
        var y: Int
        var toString: String {
            return "(x: \(x)  y: \(y))"
        }
        func manhattanDistance(to position: Position) ->  Int {
            return abs(position.x - x) + abs(position.y - y)
        }
        func isNeighbor(with position: Position) -> Bool {
            return manhattanDistance(to: position) == 1
        }
    }
    
    private struct State: Hashable  {
        var box: Position
        var person: Position
        var toString: String {
            return "(box: \(box.toString) person: \(person.toString))"
        }
    }
    
    typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    
    func minPushBox(_ grid: [[Character]]) -> Int {
        
        let M = grid.count
        let N = grid[0].count
        
        var boxPosition: Position = Position(x: -1, y: -1)
        var personPosition: Position = Position(x: -1, y: -1)
        var targetPosition: Position = Position(x: -1, y: -1)
        
        for r in 0..<M {
            for c in 0..<N {
                switch grid[r][c] {
                case "S":
                    personPosition.x = r
                    personPosition.y = c
                case "B":
                    boxPosition.x = r
                    boxPosition.y = c
                case "T":
                    targetPosition.x = r
                    targetPosition.y = c
                default:
                    break
                }
            }
        }
        
        func valid(_ x: Int, _ y: Int) -> Bool {
            return  x >= 0 && x < M  && y >= 0 && y < N && grid[x][y] != "#"
        }
        
        func getPersonPositions(_ currentBoxPosition: Position, _ currentPosonPosition: Position) -> [Position]{

            var ans = [Position]()
            
            var visited = Set<Position>()
            visited.insert(currentPosonPosition)
            var queue = [currentPosonPosition]
            
            while !queue.isEmpty {
                var nextLevel = [Position]()
                for p in queue {
                    
                    if p.isNeighbor(with: currentBoxPosition) {
                        ans.append(p)
                    }
                    
                    for dir in directions {
                        let nextX = p.x + dir.dx
                        let nextY = p.y + dir.dy
                        if valid(nextX, nextY) {
                            let nextP = Position(x: nextX, y: nextY)
                            if !visited.contains(nextP) && nextP != currentBoxPosition {
                                visited.insert(nextP)
                                nextLevel.append(nextP)
                            }
                        }
                    }
                }
                queue = nextLevel
            }
            return ans
        }
        
        var queue = [State]()
        var visited = Set<State>()
        var depth = 0
        
        for p in getPersonPositions(boxPosition,personPosition) {
            let startState = State(box: boxPosition, person: p)
            queue.append(startState)
            visited.insert(startState)
        }
        
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [State]()
            for state in queue {
                for personPosition in getPersonPositions(state.box,state.person) {
                    
                    let nextBoxPositionX = state.box.x + state.box.x - personPosition.x
                    let nextBoxPositionY = state.box.y + state.box.y - personPosition.y
                    
                    if valid(nextBoxPositionX,nextBoxPositionY) {
                        let nextBoxPosition = Position(x: nextBoxPositionX, y: nextBoxPositionY)
                        guard nextBoxPosition != targetPosition else {
                            return depth
                        }
                        let nextState = State(box: nextBoxPosition, person: state.box)
                        if !visited.contains(nextState) {
                            visited.insert(nextState)
                            nextLevel.append(nextState)
                        }
                    }
                }
            }
            queue = nextLevel
        }
        return -1
    }
 }
 
 let grid: [[Character]]  = [
    ["#",".",".","#","T","#","#","#","#"],
    ["#",".",".","#",".","#",".",".","#"],
    ["#",".",".","#",".","#","B",".","#"],
    ["#",".",".",".",".",".",".",".","#"],
    ["#",".",".",".",".","#",".","S","#"],
    ["#",".",".","#",".","#","#","#","#"]]
 Solution().minPushBox(grid)
 
