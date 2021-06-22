// https://leetcode.com/problems/find-a-peak-element-ii/
class Solution {
    func findPeakGrid(_ mat: [[Int]]) -> [Int] {
        let M = mat.count
        let N = mat[0].count
        var i = 0
        var j = 0
        while true {
            if i + 1 < M && mat[i + 1][j] > mat[i][j] {
                i += 1
                continue
            }
            if i - 1 >= 0 && mat[i - 1][j] > mat[i][j] {
                i -= 1
                continue
            }
            if j + 1 < N && mat[i][j + 1] > mat[i][j] {
                j += 1
                continue
            }
            if j - 1 >= 0 && mat[i][j - 1] > mat[i][j] {
                j -= 1
                continue
            }
            break
        }
        return [i,j]
    }
}

