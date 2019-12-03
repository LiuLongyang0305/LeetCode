//https://leetcode.com/problems/max-increase-to-keep-city-skyline/submissions/ 
class Solution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        var ans = 0
        let N = grid.count
        var rowLimit = Array<Int>(repeating: Int.min, count: N)
        var colLimit = Array<Int>(repeating: Int.min, count: N)
        for i in 0..<N {
            for j in 0..<N {
                if grid[i][j] > rowLimit[i] {
                    rowLimit[i] = grid[i][j]
                }
                if grid[i][j] > colLimit[j] {
                    colLimit[j] = grid[i][j]
                }
            }
        }
        for i in 0..<N {
            for j in 0..<N {
                ans += min(rowLimit[i], colLimit[j]) - grid[i][j]
            }
        }
        return ans
    }
 }