//https://leetcode.com/problems/walking-robot-simulation/
struct Direction {
    var dx: Int
    var dy: Int
    var SqureDistanceToOriginalPoint: Int {
        get {
            return dx * dx + dy * dy
        }
    }
    func move(diatance: Int) -> Direction {
        return Direction(dx: dx * diatance, dy: dy * diatance)
    }
    static func +(left: Direction, right: Direction) -> Direction {
        return Direction(dx: left.dx + right.dx , dy: left.dy + right.dy)
    }
    
    static func -(end: Direction, start: Direction) -> Direction {
        return Direction(dx: end.dx - start.dx, dy: end.dy - start.dy)
    }
    
    func isParalled(target: Direction) -> Bool {
        if dx == 0 && target.dx == 0 {
            return dy * target.dy > 0
        }
        if dy == 0 && target.dy == 0 {
            return dx * target.dx > 0
        }
        return false
    }
}


class Solution {
    let directions = [Direction(dx: 0, dy: 1),Direction(dx: -1, dy: 0),Direction(dx: 0, dy: -1),Direction(dx: 1, dy: 0)]
    var deltaDegrees = 0
    typealias Position = Direction
    
    
    
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        
        var direction = directions[0]
        var distance = 0
        var currentPosition = Position(dx: 0, dy: 0)
        var dicForRow = Dictionary<Int,[Int]>()
        var dicForCol = Dictionary<Int,[Int]>()
        
        for obs in obstacles {
            if dicForCol[obs[0]] == nil {
                dicForCol[obs[0]] = [obs[1]]
            } else {
                dicForCol[obs[0]]?.append(obs[1])
            }
            if dicForRow[obs[1]] == nil {
                dicForRow[obs[1]] = [obs[0]]
            } else {
                dicForRow[obs[1]]?.append(obs[0])
            }
        }
        
        func onReceiveCommand(command: Int) {
            
            var deltaPosition = direction.move(diatance: command)
            
            if deltaPosition.dy == 0 {
                let tempObstacles = dicForRow[currentPosition.dy]
                let potentionX = direction.dx == 1 ? (currentPosition.dx...(currentPosition.dx + deltaPosition.dx)) : ((currentPosition.dx + deltaPosition.dx)...currentPosition.dx)
                if tempObstacles != nil {
                    
                    for x in tempObstacles! {
                        if potentionX.contains(x) {
                            let target = Direction(dx: x, dy: currentPosition.dy) - currentPosition
                            if target.isParalled(target: direction) {
                                deltaPosition.dx = target.dx + ((direction.dx > 0) ? -1 : 1)
                            }
                        }
                    }
                }
            } else if deltaPosition.dx == 0 {
                
                let tempObstacles = dicForCol[currentPosition.dx]
                let potentionY = direction.dy == 1 ? (currentPosition.dy...(currentPosition.dy + deltaPosition.dy)) : ((currentPosition.dy + deltaPosition.dy)...currentPosition.dy)
                
                if tempObstacles != nil {
                    for y in tempObstacles! {
                        if potentionY.contains(y) {
                            
                            let target = Direction(dx: currentPosition.dx, dy: y) - currentPosition
                            
                            if target.isParalled(target: direction) {
                                deltaPosition.dy = target.dy + ((direction.dy > 0) ? -1 : 1)
                                
                            }
                        }
                    }
                }
            }
            
            currentPosition = currentPosition + deltaPosition
        }
        
        for command in commands {
            if command == -2 {
                deltaDegrees += 90
                direction = directions[deltaDegrees / 90 % 4]
            } else if command == -1 {
                deltaDegrees += 270
                direction = directions[deltaDegrees / 90 % 4]
            } else {
                onReceiveCommand(command: command)
                if currentPosition.SqureDistanceToOriginalPoint > distance {
                    distance = currentPosition.SqureDistanceToOriginalPoint
                }
            }
        }
        return distance
    }
}