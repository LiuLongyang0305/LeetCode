// https://leetcode.com/problems/largest-local-values-in-a-matrix/
class Solution {
    func largestLocal(_ grid: [[Int]]) -> [[Int]] {
        let M = grid.count - 2
        var ans = [[Int]](repeating: [Int](repeating: -1, count: M), count: M)
        for cx in 0..<M {
            for cy in 0..<M {
                var t = 0
                for dx in 0...2 {
                    for dy in 0...2 {
                        t = max(t, grid[cx + dx][cy + dy])
                    }
                }
                ans[cx][cy] = t
            }
        }
        return ans
    }
}