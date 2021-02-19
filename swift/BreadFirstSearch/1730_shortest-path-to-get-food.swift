// https://leetcode.com/problems/shortest-path-to-get-food/
class Solution {
    private let person: Character = "*"
    private let food: Character = "#"
    private let obstacle: Character = "X"
    private let space: Character = "O"
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(-1,0),(1,0)]
    func getFood(_ grid: [[Character]]) -> Int {
        
        let M = grid.count
        let N = grid[0].count
        let posOfPerson = getPositionOfPerson(from: grid)
        
        //  BFS
        var visited = Set<Int>()
        var queue = Array<Int>()
        visited.insert(posOfPerson)
        queue.append(posOfPerson)
        var steps = 0
        while !queue.isEmpty {
            steps += 1
            var nextLevel = [Int]()
            for p in queue {
                let x = p >> 8
                let y = p & 0xff
                for dir in directions {
                    let nx = x + dir.dx
                    let ny = y + dir.dy
                    let np = nx << 8 | ny
                    guard nx >= 0 && nx < M && ny >= 0 && ny < N && !visited.contains(np) else {
                        continue
                    }
                    guard grid[nx][ny] != food else {
                        return steps
                    }
                    visited.insert(np)
                    guard grid[nx][ny] == space else {
                        continue
                    }
                    nextLevel.append(np)
                }
            }
            queue = nextLevel
        }
        return -1
    }
    
    private func getPositionOfPerson(from grid: [[Character]]) -> Int {
        let M = grid.count
        let N = grid[0].count
        for r in 0..<M {
            for c in 0..<N {
                if grid[r][c] == person {
                    return r << 8 | c
                }
            }
        }
        return -1
    }
}