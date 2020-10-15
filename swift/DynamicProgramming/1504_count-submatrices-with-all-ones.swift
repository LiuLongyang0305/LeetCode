// https://leetcode.com/problems/count-submatrices-with-all-ones/
class Solution {
    func numSubmat(_ mat: [[Int]]) -> Int {
        guard !mat.isEmpty && !mat[0].isEmpty  else {
            return 0
        }
        let M = mat.count
        let N = mat[0].count
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: M)
        var ans = 0
        for i in 0..<M {
            for j in 0..<N {
                if mat[i][j] == 1 {
                    if j == 0 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = dp[i][j - 1] + 1
                    }
                    var temp = Int.max
                    for k in stride(from: i, through: 0, by: -1) {
                        temp = min(temp, dp[k][j])
                        guard temp > 0 else {
                            break
                        }
                        ans += temp
                    }
                }
            }
        }
        return ans
    }
}