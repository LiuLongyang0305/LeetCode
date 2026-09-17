    //https://leetcode.cn/problems/minimum-cost-path-with-at-most-k-turns/
    class Solution {
        private let INF = Int.max / 2
        typealias Dir = (dx:Int,dy:Int)
        struct Node:Comparable {
            static func < (lhs: Solution.Node, rhs: Solution.Node) -> Bool {
                return lhs.dis < rhs.dis
            }

            var dis:Int
            var remainTurnTime:Int
            var x: Int
            var y: Int
            var dir: Int
        }
        private let dirs:[Dir] = [(0,-1),(0,1),(-1,0),(1,0)]//左右上下
        func minCost(_ grid: [[Int]], _ k0: Int) -> Int {

            let M = grid.count
            let N = grid[0].count
            var dis = [[[[Int]]]](repeating: [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: INF, count: k0 + 1), count: 4), count: N), count: M)
            var pq = Heap<Node>()
            pq.insert(Node(dis: grid[0][0], remainTurnTime: k0, x: 0, y: 0, dir: 1))
            pq.insert(Node(dis: grid[0][0], remainTurnTime: k0, x: 0, y: 0, dir: 3))
            dis[0][0][1][k0] = grid[0][0]
            dis[0][0][3][k0] = grid[0][0]
            while let top = pq.popMin() {
                if top.x == M - 1 && top.y == N - 1 {
                    return top.dis
                }
                guard top.dis <= dis[top.x][top.y][top.dir][top.remainTurnTime] else {continue}
                for newIdx in 0...3 {
                    let x = top.x + dirs[newIdx].dx
                    let y = top.y + dirs[newIdx].dy
                    guard x >= 0 && x < M && y >= 0 && y < N else {continue}
                    if newIdx != top.dir && top.remainTurnTime == 0 {continue}
                    let newK = top.remainTurnTime - (newIdx == top.dir ? 0 : 1)
                    let newDis = grid[x][y] + top.dis
                    if newDis < dis[x][y][newIdx][newK] {
                        dis[x][y][newIdx][newK] = newDis
                        pq.insert(Node(dis: newDis, remainTurnTime: newK, x: x, y: y, dir: newIdx))
                    }
                }
            }
            return -1
        }
    }
