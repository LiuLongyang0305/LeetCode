//https://leetcode.com/problems/rotting-oranges/
class Solution {
    private typealias Direction = (dx:Int, dy: Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func orangesRotting(_ grid: [[Int]]) -> Int {
        
        let M = grid.count
        let N = grid[0].count
        
        func valid(_ x: Int, _ y: Int) -> Bool {
            return x < M && x >= 0 && y < N && y >= 0
        }
        var queue = Array<Int>()
        var freshOranges = Set<Int>()
        
        for i in 0..<M {
            for j in 0..<N {
                if grid[i][j] == 2 {
                    queue.append(i << 8 | j)
                } else if grid[i][j] == 1 {
                    freshOranges.insert(i << 8 | j)
                    
                }
            }
        }
        
        var neeededTime = 0
        while !queue.isEmpty {
            var nextLevel = [Int]()
            for p in queue {
                let x = p >> 8
                let y = p & 0xff
                for dir in directions {
                    let nextX = x + dir.dx
                    let nextY = y + dir.dy
                    if valid(nextX, nextY)  {
                        let nextP = nextX << 8 | nextY
                        if freshOranges.contains(nextP) {
                            freshOranges.remove(nextP)
                            nextLevel.append(nextP)
                        }
                    }
                }
            }
            queue = nextLevel
            if !queue.isEmpty {
                neeededTime += 1
            }
        }
        
        return freshOranges.isEmpty ? neeededTime : -1
    }
 }
 
 

