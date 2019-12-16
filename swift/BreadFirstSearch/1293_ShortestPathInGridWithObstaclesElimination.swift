//https://leetcode.com/problems/shortest-path-in-a-grid-with-obstacles-elimination/ 
class Solution {
    
    private struct State {
        var x: Int
        var y: Int
        var remain: Int
    }
    
    typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        
        let M = grid.count
        let N = grid[0].count
        
        guard M != 1 || N != 1 else {
            return 0
        }
        
        func valid(x: Int, y: Int) -> Bool {
            return x >= 0 && x <  M && y >= 0 && y < N
        }
        
        var queue = [State]()
        var visited = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: N), count: M)
        queue.append(State(x: 0, y: 0, remain: k))
        visited[0][0] = k
        
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [State]()
            for state in queue {
                for dir in directions {
                    
                    let nextX = state.x + dir.dx
                    let nextY = state.y + dir.dy
                    guard nextX != M - 1 || nextY != N - 1  else{
                        return depth
                    }
                    if valid(x: nextX, y: nextY) {
                        var nextState = State(x: nextX, y: nextY, remain: state.remain)
                        if grid[nextX][nextY] == 1 {
                            nextState.remain = state.remain - 1
                        }
                        if nextState.remain >= 0 && visited[nextX][nextY] < nextState.remain {
                            nextLevel.append(nextState)
                            visited[nextX][nextY] = nextState.remain
                        }
                        
                    }
                }
            }
            queue = nextLevel
        }
        return -1
    }
 }
