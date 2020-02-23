// https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/
class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        var ans = 0
        let M = grid.count
        let N = grid[0].count
        var r = 0
        while r < M {
            var c = N - 1
            while c >= 0 && grid[r][c] < 0 {
                ans += 1
                c -= 1
            }
            r += 1
        }
        return ans
    }
 }