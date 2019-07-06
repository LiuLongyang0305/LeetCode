//https://leetcode.com/problems/toeplitz-matrix/
class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        var dic = Dictionary<Int,Int>()
        let colSize = matrix[0].count
        for i in 0..<matrix.count {
            for j in 0..<colSize {
                let key = i - j
                if nil == dic[key] {
                    dic[key] = matrix[i][j]
                } else {
                    if dic[key]! != matrix[i][j] {
                        return false
                    }
                }
            }
        }
        return true
    }
}