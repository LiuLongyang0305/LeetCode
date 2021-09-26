// https://leetcode.com/problems/grid-game/
class Solution {
    func gridGame(_ grid: [[Int]]) -> Int {
        var right = grid[0].reduce(0) { $0 + $1}
        let M = grid[0].count
        var left = 0;
        var ans = 1_000_000_000_0
        for i in 0..<M {
            right -= grid[0][i]
            ans = min(ans, max(left, right))
            left += grid[1][i]
        }
        return ans
    }
}