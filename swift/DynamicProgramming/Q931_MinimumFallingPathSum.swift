//https://leetcode.com/problems/minimum-falling-path-sum/
class Solution {
    func minFallingPathSum(_ A: [[Int]]) -> Int {
        let rowSize = A.count
        let colSize = A[0].count
        var dpLastRow = A[0]
        var dpCurrentRow = Array<Int>(repeating: 0, count: colSize)
        for i in 1..<A.count {
            for j in 0..<colSize {
                let first = j - 1 < 0 ? Int.max : dpLastRow[j - 1]
                let third = j + 1 >= colSize ? Int.max : dpLastRow[j + 1]
                dpCurrentRow[j] = min(first, third, dpLastRow[j]) + A[i][j]
            }
            dpLastRow = dpCurrentRow
        }
        return dpLastRow.min()!
    }
}