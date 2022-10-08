// https://leetcode.com/problems/maximum-sum-of-an-hourglass/
class Solution {
    func maxSum(_ grid: [[Int]]) -> Int {

        var ans = 0
        let M = grid.count
        let N = grid[0].count
        for r in 1...(M - 2){
            for c in 1...(N - 2) {
                ans = max(ans, grid[r - 1][c - 1] + grid[r - 1][c] + grid[r - 1][c + 1] + grid[r][c] + grid[r + 1][c - 1] + grid[r + 1][c] + grid[r + 1][c + 1])
            }
        }
        return ans
    }
}