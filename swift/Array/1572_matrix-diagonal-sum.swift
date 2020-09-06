// https://leetcode.com/problems/matrix-diagonal-sum/
class Solution {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        var ans = 0
        let M = mat.count
        for r in 0..<M {
            for c in 0..<M {
                if r == c || r + c == M - 1{
                    ans += mat[r][c]
                    
                }
            }
        }
        return ans
    }
}

