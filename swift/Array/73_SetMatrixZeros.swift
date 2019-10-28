//https://leetcode.com/problems/set-matrix-zeroes/
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var setX = Set<Int>()
        var setY = Set<Int>()
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == 0 {
                    setX.insert(i)
                    setY.insert(j)
                }
            }
        }
        for row in setX {
            for col in 0..<matrix[0].count {
                matrix[row][col] = 0
            }
        }
        for col in setY {
            for row in 0..<matrix.count {
                matrix[row][col] = 0
            }
        }
    }
}