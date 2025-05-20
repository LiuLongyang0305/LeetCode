    // https://leetcode.cn/problems/find-minimum-time-to-reach-last-room-i/

    class Solution {
        private typealias Direction = (dx:Int,dy:Int)
        private let dirs:[Direction] = [(0,-1),(0,1),(1,0),(-1,0)]
        private struct State: Comparable {
            static func < (lhs: Solution.State, rhs: Solution.State) -> Bool {
                return lhs.dis < rhs.dis
            }
            var x: Int
            var y: Int
            var dis: Int

        }

        func minTimeToReach(_ moveTime: [[Int]]) -> Int {
            let M = moveTime.count
            let N = moveTime[0].count
            var dis = [[Int]](repeating: [Int](repeating: Int.max / 2, count: N), count: M)
            dis[0][0] = 0
            var minHeap = Heap<State>()
            minHeap.insert(State(x: 0, y: 0, dis: 0))
            var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)
            while let min = minHeap.popMin() {
                if visited[min.x][min.y] {
                    continue
                }
                visited[min.x][min.y] = true

                for (dx,dy) in dirs {
                    let nx = min.x + dx
                    let ny = min.y + dy
                    if nx < 0 || nx >= M || ny < 0 || ny >= N {
                        continue
                    }
                    let dist = max(dis[min.x][min.y], moveTime[nx][ny]) + 1
                    if dis[nx][ny] > dist {
                        dis[nx][ny] = dist
                        minHeap.insert(State(x: nx, y: ny, dis: dist))
                    }
                }
            }
            return dis[M - 1][N - 1]
        }
    }