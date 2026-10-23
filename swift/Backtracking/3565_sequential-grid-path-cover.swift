    // https://leetcode.cn/problems/sequential-grid-path-cover/
        class Solution {
            private typealias Pair = (x:Int,y:Int)
            private typealias Direction = (dx:Int,dy:Int)
            private let dirs:[Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
            func findPath(_ grid: [[Int]], _ k: Int) -> [[Int]] {
                let M = grid.count
                let N = grid[0].count
                //状态压缩
                var visited = 0
                var path = [Pair]()
                var ans = [Pair]()


                func dfs(_ x: Int, _ y: Int, _ limit:Int) {
                    guard ans.isEmpty else {return}
                    path.append((x,y))
                    visited = visited | (1 << (x * N + y))
                    for (dx,dy) in dirs {
                        let nx = x + dx
                        let ny = y + dy
                        guard nx >= 0 && nx < M && ny >= 0 && ny < N else {continue}
                        let newMask = 1 << (nx * N + ny)
                        guard visited & newMask == 0 else {continue}
                        if grid[nx][ny] == 0 {
                            dfs(nx, ny, limit)
                        } else if grid[nx][ny] == limit + 1 {
                            dfs(nx, ny, limit + 1)
                        }

                    }
                    if path.count == M * N {
                        ans = path
                    }
                    let _ = path.popLast()
                    visited = visited & (~(1 << (x * N + y)))
                }


                for i in 0..<M {
                    for j in 0..<N {
                        if grid[i][j] <= 1 {
                            dfs(i, j, grid[i][j])
                        }
                        guard ans.isEmpty else {break}
                    }
                    guard ans.isEmpty else {break}
                }


                return ans.map { [$0.x,$0.y]}
            }
        }
