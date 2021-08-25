// https://leetcode.com/problems/maximum-matrix-sum/
class Solution {
    func maxMatrixSum(_ matrix: [[Int]]) -> Int {
        var cnt = 0
        let M = matrix.count
        var minNotNegativeEle = Int.max
        var ans = 0
        for r in 0..<M {
            for c in 0..<M {
                minNotNegativeEle = min(minNotNegativeEle, abs(matrix[r][c]))
                if matrix[r][c] < 0 {
                    cnt += 1
                    ans += -matrix[r][c]
                } else {
                    ans += matrix[r][c]
                }
            }
        }
        return cnt & 1 == 0 ? ans : (ans - 2 * minNotNegativeEle)
    }
}