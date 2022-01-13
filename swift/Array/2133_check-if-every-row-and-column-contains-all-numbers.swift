// https://leetcode.com/problems/check-if-every-row-and-column-contains-all-numbers/
class Solution {
    func checkValid(_ matrix: [[Int]]) -> Bool {
        let N = matrix.count
        var rows = [Bool](repeating: false, count: N * N)
        var cols = [Bool](repeating:false, count: N * N)
        
        for r in 0..<N {
            for c in 0..<N {
                let rowIdx = N * r + matrix[r][c] - 1
                guard !rows[rowIdx] else {return false}
                rows[rowIdx] = true
                let colIdx = N * c + matrix[r][c] - 1
                guard !cols[colIdx] else {return false}
                cols[colIdx] = true
            }
        }
        return true
    }
}