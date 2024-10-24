//https://leetcode.cn/problems/minimum-number-of-flips-to-make-binary-grid-palindromic-i/
class Solution {
    func minFlips(_ grid: [[Int]]) -> Int {
        var diffRow = 0, diffCol = 0
        let N = grid.count
        let M = grid[0].count

        for row in grid {
            var l = 0
            var r = M - 1
            while l < r {
                if row[l] != row[r] {
                    diffRow += 1
                }
                l += 1
                r -= 1
            }
        }

        for col in 0..<M {
            var l = 0
            var r = N - 1
            while l < r {
                if grid[l][col] !=  grid[r][col] {
                    diffCol += 1
                }
                l += 1
                r -= 1
            }
        }

        return min(diffRow, diffCol)
    }
}