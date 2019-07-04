//["123"](https://leetcode.com/problems/longest-palindromic-subsequence/)
class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let size = s.count
        let stringToArray = Array<Character>(s)
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: size), count: size)
        var i = size - 1
        while i >= 0 {
            dp[i][i] = 1
            for j in (i + 1)..<size {
                if stringToArray[i] == stringToArray[j] {
                    dp[i][j] = dp[i + 1][j - 1] + 2
                } else {
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                }
            }
            i -= 1
        }
        return dp[0][size - 1]
    }
}