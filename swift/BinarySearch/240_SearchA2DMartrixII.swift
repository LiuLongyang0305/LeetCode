//https://leetcode.com/problems/search-a-2d-matrix-ii/
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var x = matrix.count - 1
        var y = 0
        while x >= 0 && y < matrix[0].count {
            if matrix[x][y] > target {
                x -= 1
                continue
            }
            if matrix[x][y] < target {
                y += 1
                continue
            }
            return true
        }
        return false
    }
}
class Solution2 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
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