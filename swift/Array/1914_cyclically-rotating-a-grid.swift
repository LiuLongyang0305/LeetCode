// https://leetcode.com/problems/cyclically-rotating-a-grid/
class Solution {
    func rotateGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        let M = grid.count
        let N = grid[0].count
        let cyclesCnt = min(M, N) >> 1
        var ans = grid
        for cycle in 0..<cyclesCnt {
            var rows = [Int]()
            var cols = [Int]()
            var values = [Int]()
            
            for i in cycle..<(M - 1 - cycle) {
                rows.append(i)
                cols.append(cycle)
                values.append(grid[i][cycle])
            }
            for j in cycle..<(N - cycle - 1) {
                rows.append(M - cycle - 1)
                cols.append(j)
                values.append(grid[M - cycle - 1][j])
            }
            for i in stride(from: M - cycle - 1, to: cycle, by: -1) {
                rows.append(i)
                cols.append(N - cycle - 1)
                values.append(grid[i][N - cycle - 1])
            }
            for j in stride(from: N - cycle - 1, to: cycle, by: -1) {
                rows.append(cycle)
                cols.append(j)
                values.append(grid[cycle][j])
            }
            
            let total = values.count
            let kk = k % total
            for i in 0..<total {
                let idx = (i + total - kk) % total
                ans[rows[i]][cols[i]] = values[idx]
            }
        }
        return ans
    }
}



