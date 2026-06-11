    //https://leetcode.cn/problems/minimum-time-to-visit-a-cell-in-a-grid/
class Solution {
    private let INF = 1_000_000_007
    private typealias Direction = (dx:Int, dy: Int)
    private let dirs:[Direction] = [(0,1),(1,0),(-1,0),(0,-1)]
    private struct NodeAndTime: Comparable {
        static func < (lhs: Solution.NodeAndTime, rhs: Solution.NodeAndTime) -> Bool {
            return lhs.time < rhs.time
        }

        var x: Int
        var y: Int
        var time:Int
    }
    func minimumTime(_ grid: [[Int]]) -> Int {
            //必须能消磨时间
        guard grid[0][1] <= 1 || grid[1][0] <= 1 else {return -1}

        let M = grid.count
        let N = grid[0].count

        var dis = [[Int]](repeating: [Int](repeating: INF, count: N), count: M)
        dis[0][0] = 0
        var minHeap = Heap<NodeAndTime>()
        minHeap.insert(NodeAndTime(x: 0, y: 0, time: 0))

        while let top = minHeap.popMin() {

            if dis[top.x][top.y] < top.time {continue}
            for (dx,dy) in dirs {
                let newX = top.x + dx
                let newY = top.y + dy
                guard newX >= 0 && newX < M && newY >= 0 && newY < N else {continue}

                if grid[newX][newY] <= top.time + 1 {
                    let newTime = top.time + 1
                    if newTime >= dis[newX][newY] {continue}
                    dis[newX][newY] = newTime
                    minHeap.insert(NodeAndTime(x: newX, y: newY, time: newTime))
                } else {
                    let diff = grid[newX][newY] - (top.time + 1)
                    let newTime = grid[newX][newY] + (diff & 1)
                    if newTime >= dis[newX][newY] {continue}
                    dis[newX][newY] = newTime
                    minHeap.insert(NodeAndTime(x: newX, y: newY, time: newTime))
                }
            }
        }
        return dis[M - 1][N - 1]
    }
}
