//https://leetcode.com/problems/spiral-matrix/
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty || matrix.count == 1 {
            return matrix.isEmpty ? [] : matrix[0]
        }
        var ans = [Int]()
        if matrix[0].count == 1 {
            for i in 0..<matrix.count {
                ans.append(matrix[i][0])
            }
            return ans
        }
        var left = 0
        var right = matrix[0].count - 1
        var top  = 0
        var bottom = matrix.count - 1
        let count = matrix.count * matrix[0].count
        while true {
            for i in left...right {
                ans.append(matrix[top][i])
            }
            if  ans.count  == count {
                return ans
            }
            top += 1
            for i in top...bottom {
                ans.append(matrix[i][right])
            }
            if  ans.count  == count {
                return ans
            }
            right -= 1

            for i in (left...right).reversed() {
                ans.append(matrix[bottom][i])
            }
            if  ans.count  == count {
                return ans
            }
            bottom -= 1
            for i in (top...bottom).reversed() {
                ans.append(matrix[i][left])
            }
            if  ans.count  == count {
                return ans
            }
            left += 1

        }
        return ans
    }
}