// https://leetcode.com/problems/path-crossing/
class Solution {
    private struct Position: Hashable {
        var x: Int
        var y: Int
        mutating func go(_ deltaX: Int, _ deltayY: Int) {
            x += deltaX
            y += deltayY
        }
    }
    func isPathCrossing(_ path: String) -> Bool {
        var visited = Set<Position>()
        var curPosition = Position(x: 0, y: 0)
        visited.insert(curPosition)
        
        for d in path {
            switch d {
            case "N":
                curPosition.go(0, 1)
            case "S":
                curPosition.go(0, -1)
            case "E":
                curPosition.go(1, 0)
            case "W":
                curPosition.go(-1, 0)
            default:
                break
            }
            guard !visited.contains(curPosition) else {
                return true
            }
            visited.insert(curPosition)
        }
        return false
    }
}

