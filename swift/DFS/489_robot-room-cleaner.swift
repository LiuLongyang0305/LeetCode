// https://leetcode.com/problems/robot-room-cleaner/
/**
 * // This is the robot's control interface.
 * // You should not implement it, or speculate about its implementation
 * public class Robot {
 *     // Returns true if the cell in front is open and robot moves into the cell.
 *     // Returns false if the cell in front is blocked and robot stays in the current cell.
 *     public func move() -> Bool {}
 *
 *     // Robot will stay in the same cell after calling turnLeft/turnRight.
 *     // Each turn will be 90 degrees.
 *     public func turnLeft() {}
 *     public func turnRight() {}
 *
 *     // Clean the current cell.
 *     public func clean() {}
 * }
 */

class Solution {
    
    private struct Position: Hashable {
        var x: Int
        var y: Int
    }
    private typealias Direction = (dx:Int, dy: Int)
    private let directions:[Direction] = [(-1,0),(0,1),(1,0),(0,-1)]
    func cleanRoom(_ robot: Robot) {
        
        
        
        func goback() {
            robot.turnRight()
            robot.turnRight()
            let _ = robot.move()
            robot.turnRight()
            robot.turnRight()
        }
        
        var visited = Set<Position>()
        
        func dfs(_ x: Int, _ y: Int, _ d: Int) {
            visited.insert(Position(x: x, y: y))
            robot.clean()
            for idx in 0..<4 {
                let newD = (idx + d) % 4
                let newRow = x + directions[newD].dx
                let newCol = y + directions[newD].dy
                if !visited.contains(Position(x: newRow, y: newCol)) && robot.move() {
                    dfs(newRow, newCol, newD)
                    goback()
                }
                robot.turnRight()
            }
        }
        
        dfs(0,0,0)
    }
}
