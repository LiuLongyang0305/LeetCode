// https://leetcode.com/problems/maximize-palindrome-length-from-subsequences/
class Solution {
    func longestPalindrome(_ word1: String, _ word2: String) -> Int {
        //connect
        let s = word1 + word2
        let size = s.count
        let stringToArray = Array<Character>(s)

        let M = word1.count
        
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: size), count: size)
        var i = size - 1
        var ans = 0
        while i >= 0 {
            dp[i][i] = 1
            for j in (i + 1)..<size {
                if stringToArray[i] == stringToArray[j] {
                    dp[i][j] = dp[i + 1][j - 1] + 2
                    if i < M && j >= M {
                        ans = max(ans, dp[i][j])
                    }
                } else {
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                }
            }
            i -= 1
        }
        
        return ans
    }
}


