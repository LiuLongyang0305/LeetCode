  // https://leetcode.cn/problems/minimum-cost-path-with-alternating-directions-iii/
    class Solution {
        struct PosCost: Comparable {
            static func < (lhs: Solution.PosCost, rhs: Solution.PosCost) -> Bool {
                return lhs.cost < rhs.cost
            }

            var i: Int
            var j: Int
            var isOdd: Bool
            var cost: Int
        }
        func minCost(_ m: Int, _ n: Int, _ penalty: [[Int]]) -> Int {
            var minDis = [[[Int]]](repeating: [[Int]](repeating:[Int.max,Int.max] , count: n), count: m)
            minDis[0][0][0] = 1

            func valid(_ x: Int, _ y: Int) -> Bool {
                return x >= 0 && x < m && y >= 0 && y < n
            }
            var minHeap = Heap<PosCost>()
            minHeap.insert(PosCost(i: 0, j: 0, isOdd: false, cost: 1))
            while let top = minHeap.popMin() {
                let newIsOdd = !top.isOdd
                let idx = newIsOdd ? 1 : 0
                let x = top.i
                let y = top.j
                //停在原地
                if minDis[x][y][idx] > penalty[x][y] + top.cost {
                    minDis[x][y][idx] = penalty[x][y] + top.cost
                    minHeap.insert(PosCost(i: x, j: y, isOdd: newIsOdd, cost: penalty[x][y] + top.cost))
                }

                for (dx,dy) in [(0,1),(1,0)] {
                    let nx = x + dx
                    let ny = y + dy
                    guard valid(nx, ny) else {continue}
                    let nc = top.cost + (nx + 1) * (ny + 1) + (newIsOdd ? 0 : penalty[x][y])
                    if nc < minDis[nx][ny][idx] {
                        minDis[nx][ny][idx] = nc
                        minHeap.insert(PosCost(i: nx, j: ny, isOdd: newIsOdd, cost: nc))
                    }
                }

                for (dx,dy) in [(0,-1),(-1,0)] {
                    let nx = x + dx
                    let ny = y + dy
                    guard valid(nx, ny) else {continue}
                    let nc = top.cost + (nx + 1) * (ny + 1) + (newIsOdd ? penalty[x][y] : 0)
                    if nc < minDis[nx][ny][idx] {
                        minDis[nx][ny][idx] = nc
                        minHeap.insert(PosCost(i: nx, j: ny, isOdd: newIsOdd, cost: nc))
                    }
                }
            }
            return minDis[m - 1][n - 1].min()!
        }
    }
