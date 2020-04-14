//  https://leetcode.com/problems/champagne-tower/
class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var A = Array<Array<Double>>(repeating: Array<Double>(repeating: 0.0, count: 102), count: 102)
        A[0][0] = Double(poured)
        for r in 0...query_row {
            for c in 0...r {
                let q = (A[r][c] - 1.0) / 2.0
                if q > 0 {
                    A[r + 1][c] += q
                    A[r + 1][c + 1] = q
                }
            }
        }
        return min(1.0, A[query_row][query_glass])
    }
}