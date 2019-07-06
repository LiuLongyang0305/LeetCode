//https://leetcode.com/problems/flipping-an-image/
class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        let rowSize = A.count
        let colSize = A[0].count
        var result = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: colSize), count: rowSize)
        for i in 0..<rowSize {
            for j in 0..<colSize {
                let ele = A[i][j] == 1 ? 0 : 1
                result[i][colSize - j - 1] = ele
            }
        }
        return result
    }
}