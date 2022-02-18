//  https://leetcode-cn.com/problems/shortest-path-in-a-hidden-grid/
/**
 * // This is the GridMaster's API interface.
 * // You should not implement it, or speculate about its implementation
 * class GridMaster {
 *     public func canMove(direction: Character) -> Bool {}
 *     public func move(direction: Character) {}
 *     public func isTarget() -> Bool {}
 * }
 */

class Solution {
    typealias Direction = (dx:Int,dy:Int)
    //                                     R     L     D     U
    private let directions:[Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    private let directionToIndex:[(Character,Int)] = [("R",0),("L",1),("D",2),("U",3)]
    private let reverseDirection:[Character:Character] = ["R":"L","L":"R","U":"D","D":"U"]
    private typealias Position = (x:Int,y:Int)
    func findShortestPath( _ master: GridMaster) -> Int {
        let M = 505
        let N = 505
        var grid = [[Int]](repeating: [Int](repeating: 0, count: N * 2), count: M * 2)
        grid[505][505] = -1
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: N * 2), count: M * 2)
        
        var targetX = -1,targetY = -1
        
        func dfs(_ x: Int, _ y: Int) {
            // print("\(x)  \(y)")
            visited[x][y] = true

            if master.isTarget() {
                // print("\(x) \(y)")
                grid[x][y] = 2
                targetX = x
                targetY = y
            } else {
                if x != 505 || y != 505 {
                    grid[x][y] = 1
                }
            }
            
            for (dir,idx) in directionToIndex {
                guard master.canMove(dir) else {continue}
                let newX = x + directions[idx].dx
                let newY = y + directions[idx].dy
                guard !visited[newX][newY] else {continue}
                master.move(dir)
                dfs(newX, newY)
                master.move(reverseDirection[dir]!)
            }
        }
        dfs(505, 505)
        // print("\(grid[504][505])  \(grid[504][506])  \(grid[505][505]) \(grid[505][506])")
        guard targetX != -1 else {
            return -1
        }
        guard targetX != 505 || targetY != 505 else {return 0}
        //假设起始位置在（505，505）
        var queue = [Position]()
        var seen = [[Bool]](repeating: [Bool](repeating: false, count: N * 2), count: M * 2)
        seen[505][505] = true
        queue.append((505,505))
        var steps = 0
        while !queue.isEmpty {
            steps += 1
            var newLevel = [Position]()
            for (x,y) in queue {
                for (_,dirIdx) in directionToIndex {
                    let dir = directions[dirIdx]
                    let nx = x + dir.dx
                    let ny = y + dir.dy
                    guard grid[nx][ny] != 2 else {return steps}
                    guard !seen[nx][ny] && grid[nx][ny] == 1 else {continue}
                    seen[nx][ny] = true
                    newLevel.append((nx,ny))
                }
            }
            queue = newLevel
        }
        return -1
    }
}