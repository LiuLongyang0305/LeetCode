// https://leetcode.com/problems/valid-palindrome-iii/
class Solution {
    func isValidPalindrome(_ s: String, _ k: Int) -> Bool {
        guard s.count > 1 else {
            return true
        }
        return s.count - getLongestPalindromeSubsequence(s) <= k
    }
    
    private func getLongestPalindromeSubsequence(_ s: String) -> Int {
        let n = s.count
        guard n > 1 else {
            return n
        }
        let chars = [Character](s)
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: n), count: n)
        (0..<n).forEach {dp[$0][$0] = 1}
        for i in stride(from: n - 1, through: 0, by: -1) {
            var j = i + 1
            while j < n {
                if chars[i] == chars[j] {
                    dp[i][j] = 2 + dp[i + 1][j - 1]
                } else {
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                }
                j += 1
            }
        }
        return dp[0][n - 1]
    }
}
