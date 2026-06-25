    // https://leetcode.cn/problems/maximum-number-of-moves-to-kill-all-pawns/
class Solution {
    private let dirs = [(2,1),(1,2),(-1,2),(-2,1),(-2,-1),(-1,-2),(1,-2),(2,-1)]
    func maxMoves(_ kx: Int, _ ky: Int, _ positions: [[Int]]) -> Int {
        let N = positions.count
        var dis = [[[Int]]](repeating: [], count: N + 1)

        func bfsToShortSteps(_ idx: Int, _ pos: [Int]) {
            var d = [[Int]](repeating: [Int](repeating: -1, count: 50), count: 50)
            let px = pos[0], py = pos[1]
            d[px][py] = 0
            var queue = [(Int,Int)]()
            queue.append((px,py))
            var step = 1
            while true {
                guard !queue.isEmpty else {break}
                var newQueue = [(Int,Int)]()
                for (cx,cy) in queue {
                    for (dx,dy) in dirs {
                        let nx = cx + dx
                        let ny = cy + dy
                        if nx >= 0 && nx < 50 && ny >= 0 && ny < 50 && d[nx][ny] < 0 {
                            d[nx][ny] = step
                            newQueue.append((nx,ny))
                        }
                    }
                }
                step += 1
                queue = newQueue
            }
            dis[idx] = d
        }

            //计算每个马到不同位置的最短距离
        for i in 0..<N {
            bfsToShortSteps(i, positions[i])
        }
        bfsToShortSteps(N , [kx,ky])

        var memo = [[Int]](repeating: [Int](repeating: -1, count: 1 << N), count: N + 1)
        func dfs(_ i: Int, _ mask: Int) -> Int {
            guard mask > 0 else {return 0}
            if memo[i][mask] != -1 {
                return memo[i][mask]
            }
            let x = i < N ? positions[i][0] : kx
            let y = i < N ? positions[i][1] : ky
            var sb = 0
            let u = (1 << N) - 1
            let t = u ^ mask
            //Alice turn
            if t.nonzeroBitCount % 2 == 0 {
                for j in 0..<N {
                    if (mask >> j & 1) > 0 {
                        sb = max(sb,dfs(j,mask ^ (1 << j)) + dis[j][x][y])
                    }
                }
            } else {//Bob turn
                sb = Int.max
                for j in 0..<N {
                    if (mask >> j & 1) > 0 {
                        sb = min(sb,dfs(j,mask ^ (1 << j)) + dis[j][x][y])
                    }
                }
            }
            memo[i][mask] = sb
            return sb
        }


        return dfs(N, (1 << N) - 1)
    }
}
