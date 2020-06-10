// https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof/
class Solution {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        var x = matrix.count - 1
        var y = 0
        while x >= 0 && y < matrix[0].count {
            if matrix[x][y] > target {
                x -= 1
            } else if matrix[x][y] < target {
                y += 1
            } else {
                return true
            }
        }
        return false
    }
}