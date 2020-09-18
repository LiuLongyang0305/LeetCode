// https://leetcode.com/problems/bomb-enemy/
class Solution {
    func maxKilledEnemies(_ grid: [[Character]]) -> Int {
        let M = grid.count
        guard M > 0 else {
            return 0
        }
        let N = grid[0].count
        guard N > 0 else {
            return 0
        }
        func count(_ r: Int, _ c: Int) -> Int {
            var ans = 0
            var curRow = r
            //up
            while curRow >= 0 && grid[curRow][c] != "W" {
                if grid[curRow][c] == "E" {
                    ans += 1
                }
                curRow -= 1
            }
            // down
            curRow = r
            while curRow < M &&  grid[curRow][c] != "W" {
                if grid[curRow][c] == "E" {
                    ans += 1
                }
                curRow += 1
            }
            var curCol = c
            // left
            while curCol >= 0 && grid[r][curCol] != "W" {
                if grid[r][curCol] == "E" {
                    ans += 1
                }
                curCol -= 1
            }
            // right
            curCol = c
            while curCol < N && grid[r][curCol] != "W" {
                if grid[r][curCol] == "E" {
                    ans += 1
                }
                curCol += 1
            }
            return ans
        }
        var ans = 0
        for r in 0..<M {
            for c in 0..<N {
                if grid[r][c] == "0" {
                    ans = max(ans, count(r, c))
                }
                
            }
        }
        return ans
    }
}