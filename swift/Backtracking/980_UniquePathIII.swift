//https://leetcode.com/problems/unique-paths-iii/
class Solution {
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    typealias Direction = (dx:Int,  dy: Int)
    private let directions: [Direction] = [(0,1),(0,-1),(-1,0),(1,0)]
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        let row = grid.count
        let col = grid[0].count
        var startPosition = Position(x: -1, y: -1)
        var endPosition = Position(x: -1, y: -1)
        var empyCells = Set<Position>()
        var obstacles = Set<Position>()
        var ans = 0
        
        for x in 0..<row {
            for y in 0..<col {
                let p = Position(x: x, y: y)
                if grid[x][y] == 1 {
                    startPosition = p
                } else if grid[x][y] == 2  {
                    endPosition =  p
                } else if grid[x][y] == 0 {
                    empyCells.insert(p)
                } else {
                    obstacles.insert(p)
                }
            }
        }
        
        func valid(_ p: Position) -> Bool {
            return p.x >= 0 && p.x < row && p.y >= 0 && p.y < col && !obstacles.contains(p)
        }
        
        func backtracking(_ p: Position,_ toVisited: inout Set<Position>) {
            for dir in directions {
                let newP: Position = Position(x: p.x + dir.dx, y: p.y + dir.dy)
                if newP  == endPosition {
                    if toVisited.isEmpty {
                        ans += 1
                    }
                } else {
                    if  valid(newP) && toVisited.contains(newP)  {
                        toVisited.remove(newP)
                        backtracking(newP, &toVisited)
                        toVisited.insert(newP)
                    }
                }
            }
        }
        
        var toVisited = empyCells
        backtracking(startPosition, &toVisited)
        return ans
    }
}