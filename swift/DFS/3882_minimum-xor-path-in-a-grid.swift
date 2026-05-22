    //https://leetcode.cn/problems/minimum-xor-path-in-a-grid/
    class Solution {

        func minCost(_ grid: [[Int]]) -> Int {

            let M = grid.count
            let N = grid[0].count

            var memo = [[Set<Int>]](repeating: [Set<Int>](repeating: [], count: N), count: M)

            func dfs(_ r: Int, _ c: Int, _ xor: Int) {
                let newXor = xor ^ grid[r][c]
                guard !memo[r][c].contains(newXor) else {return}
                memo[r][c].insert(newXor)
                for (dx,dy) in [(0,1),(1,0)] {
                    let nr = r + dx
                    let nc = c + dy
                    guard nr >= 0 && nr < M && nc >= 0 && nc < N else {continue}
                    dfs(nr,nc,newXor)
                }
            }

            dfs(0, 0, 0)
            return memo[M - 1][N - 1].min()!
        }
    }
