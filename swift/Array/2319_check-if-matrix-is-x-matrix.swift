// https://leetcode.com/problems/check-if-matrix-is-x-matrix/
class Solution {
    func checkXMatrix(_ grid: [[Int]]) -> Bool {
        let n = grid.count
        for i in 0..<n {
            for j in 0..<n {
                if i == j || (i + j == n - 1) {
                    guard grid[i][j] != 0 else {return false}
                } else {
                    guard grid[i][j] == 0 else {return false}
                }
            }
        }
        return true
    }
}