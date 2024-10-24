// https://leetcode.cn/problems/find-the-minimum-area-to-cover-all-ones-i/
    class Solution {
        func minimumArea(_ grid: [[Int]]) -> Int {
            let N = grid.count
            let M = grid[0].count
            var leftCol = M - 1
            var rightCol = 0
            var topRow = N - 1
            var bottomRow = 0
            for r in 0..<N {
                for c in 0..<M {
                    if grid[r][c] == 1 {
                        if c < leftCol {
                            leftCol = c
                        }
                        if c > rightCol {
                            rightCol = c
                        }
                        if r < topRow {
                            topRow = r
                        }
                        if r > bottomRow {
                            bottomRow = r
                        }
                    }
                }
            }
            return (bottomRow - topRow + 1) * (rightCol - leftCol + 1)
        }
    }