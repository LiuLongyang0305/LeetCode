// https://leetcode.com/problems/minimum-path-cost-in-a-grid/
class Solution {
    func minPathCost(_ grid: [[Int]], _ moveCost: [[Int]]) -> Int {
        let M = grid.count
        let N = grid[0].count
        var last = grid[0]
        for row in 1..<M {
            var cur = grid[row]

            for col in 0..<N {
                var t = Int.max
                for c1 in 0..<N {
                    t = min(t, last[c1] + moveCost[grid[row - 1][c1]][col])
                }
                cur[col] += t
            }
            last = cur
        }
        return last.min()!
    }
}
