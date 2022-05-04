// https://leetcode.com/problems/escape-the-spreading-fire/
class Solution {
    private typealias Info = (isGrass:Bool,minute:Int)
    private let INF = 1_000_000_007
    private typealias Direction = (dx:Int,dy:Int)
    private let dirs:[Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    private typealias Position = (x:Int,y:Int)
    func maximumMinutes(_ grid: [[Int]]) -> Int {

        let M = grid.count
        let N = grid[0].count

        let target: Position = (M - 1,N - 1)

        var state = [[Int]](repeating: [Int](repeating: INF, count: N), count: M)

        var fires = [Position]()
        for r in 0..<M {
            for c in 0..<N {
                if 1 == grid[r][c] {
                    state[r][c] = 0
                    fires.append((r,c))
                }
            }
        }


            //BFS更新草地会被燃烧的时间

        func  caculateState() {
            var queue = fires
            while !queue.isEmpty {
                var newQueue = [Position]()
                for (x,y) in queue {
                    for (dx,dy) in dirs {
                        let nx = x + dx
                        let ny = y + dy
                        guard nx >= 0 && nx < M && ny >= 0 && ny < N && 0 == grid[nx][ny] && INF == state[nx][ny] else {continue}
                        state[nx][ny] = state[x][y] + 1
                        newQueue.append((nx,ny))
                    }
                }
                queue = newQueue
            }
        }
        caculateState()
        func check(_ startTime: Int) -> Bool {

            var visited = [[Int]](repeating: [Int](repeating:INF, count: N), count: M)

            guard 0 == grid[0][0] && state[0][0] > startTime else {return false}
            visited[0][0] = startTime
            var time = startTime
            var queue = [(0,0)]

            while !queue.isEmpty {
                var newQueue = [Position]()
                time += 1
                for (x,y) in queue {
                    for (dx,dy) in dirs {
                        let nx = x + dx
                        let ny = y + dy
                        guard nx >= 0 && nx < M && ny >= 0 && ny < N && INF == visited[nx][ny] && 0 == grid[nx][ny] else {continue}
                        visited[nx][ny] = visited[x][y] + 1
                        let newP:Position = (nx,ny)
                        guard newP != target else {return visited[nx][ny] <= state[nx][ny]}
                        if visited[nx][ny] < state[nx][ny] {
                            newQueue.append(newP)
                        }
                    }
                }
                queue = newQueue

            }
            return false
        }

        var flag = false
        var left = 0
        var right = M * N
        while left < right {
            let mid = (left + right + 1) >> 1
            if check(mid) {
                flag = true
                left = mid
            } else {
                right = mid - 1
            }
        }

        return check(0) ? (left >= M * N ? 1_000_000_000 : left ) : -1
    }
}