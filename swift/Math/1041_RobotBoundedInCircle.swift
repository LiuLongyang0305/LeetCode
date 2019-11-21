//https://leetcode.com/problems/robot-bounded-in-circle/
class Solution {
    enum Direction {
        case east
        case west
        case north
        case sourth
        typealias DetailDirection = (dx:Int,dy:Int)
        mutating func nextDirection(turn to: Character)  {
            if  to == "R"  {
                switch self {
                case .east:
                    self  = .sourth
                case .west:
                    self  = .north
                case .north:
                    self  = .east
                case .sourth:
                    self  = .west
                }
            } else {
                switch self {
                case .east:
                    self  = .north
                case .west:
                    self  = .sourth
                case .north:
                    self  = .west
                case .sourth:
                    self  = .east
                }
            }
        }
        
        func getDirection() -> DetailDirection {
            switch self {
            case .east:
                return  (1,0)
            case .west:
                return (-1,0)
            case .north:
                return (0,1)
            case .sourth:
                return (0,-1)
            }
        }
    }
    typealias Position = (x:Int,y: Int)
    func isRobotBounded(_ instructions: String) -> Bool {
        let startPosition: Position = (0,0)
        var position: Position = startPosition
        var direction: Direction = .east
        for ch in instructions {
            if ch == "G" {
                position.x += direction.getDirection().dx
                position.y += direction.getDirection().dy
            } else {
                direction.nextDirection(turn: ch)
            }
        }
        return !(position != startPosition && direction == .east)
    }
}