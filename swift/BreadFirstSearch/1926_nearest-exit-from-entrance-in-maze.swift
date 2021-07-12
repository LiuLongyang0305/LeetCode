// https://leetcode.com/problems/nearest-exit-from-entrance-in-maze/
class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private typealias Position  = (x:Int,y:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        var steps = 0
        let M = maze.count
        let N = maze[0].count
        
        func check(_ pos: Position) -> Bool {
            return pos.x == 0 || pos.x == M - 1 || pos.y == 0 || pos.y == N - 1
        }
        var queue = [Position]()
        queue.append((entrance[0],entrance[1]))
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
        visited[entrance[0]][entrance[1]] = true
        while !queue.isEmpty {
            steps += 1
            var newQueue = [Position]()
            for (x,y) in queue {
                for (dx,dy) in directions {
                    let nx = x + dx
                    let ny = y + dy
                    guard nx >= 0 && nx < M && ny >= 0 && ny < N  && maze[nx][ny] == "." && !visited[nx][ny]else {
                        continue
                    }
                    visited[nx][ny] = true
                    let np = (nx,ny)
                    guard !check(np) else {
                        return steps
                    }
                    newQueue.append(np)
                }
            }
            queue = newQueue
        }
        return -1
    }
}