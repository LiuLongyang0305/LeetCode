//https://leetcode.com/problems/transpose-matrix/
class Solution {
    func transpose(_ A: [[Int]]) -> [[Int]] {
        let rowSize = A.count
        let colSize = A[0].count
        var result = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: rowSize), count: colSize)
        for i in 0..<rowSize {
            for j in 0..<colSize {
                result[j][i] = A[i][j]
            }
        }
        return result
    }
}