// https://leetcode.com/problems/longest-common-subsequence/
class Solution {
     func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1chars = [Character](text1)
        let text2chars = [Character](text2)
        let row = text1.count
        let col = text2.count
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: col), count: row)
        for j in 0..<col {
            if text1chars[0] == text2chars[j] {
                dp[0][j] = 1
            } else if j != 0 {
                dp[0][j] = dp[0][j - 1]
            }
        }
        for j in 0..<row {
            if text1chars[j] == text2chars[0] {
                dp[j][0] = 1
            } else if j != 0 {
                dp[j][0] = dp[j - 1][0]
            }
        }
        for i in 1..<row {
            for j in 1..<col {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1] + (text1chars[i] == text2chars[j] ? 1 : 0))
            }
        }
        return dp[row - 1][col - 1]
     }
 }