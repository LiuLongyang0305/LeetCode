//https://leetcode.com/problems/shortest-path-in-a-grid-with-obstacles-elimination/ 
class Solution {
    private struct State: Hashable {
        var  x: Int
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
        var visited = Set<State>()
        let startState = State(x: 0, y: 0, remain: k)
        queue.append(startState)
        visited.insert(startState)
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            let length = queue.count
            for _ in 0..<length {
                let state = queue.removeFirst()
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
                        if nextState.remain >= 0 && !visited.contains(nextState){
                            queue.append(nextState)
                            visited.insert(nextState)
                        }
                    }
                }
            }
            
        }
        return -1
    }
 }