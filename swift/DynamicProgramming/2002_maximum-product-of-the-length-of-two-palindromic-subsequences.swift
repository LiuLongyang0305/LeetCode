// https://leetcode.com/problems/maximum-product-of-the-length-of-two-palindromic-subsequences/
class Solution {
    func maxProduct(_ s: String) -> Int {
        var ans = 1
        let chars = [Character](s)
        let N = s.count
        for subset in 1..<((1 << N) - 1) {
            var str1 = ""
            var str2 = ""
            for i in 0..<N {
                if subset & (1 << i) == 0 {
                    str1.append(chars[i])
                } else {
                    str2.append(chars[i])
                }
            }
            if check(str1) {
                ans = max(ans, str1.count * getLongestPalindromeSubsequence(str2))
            }
        }
        return ans
    }
    private func getLongestPalindromeSubsequence(_ s: String) -> Int {
        let n = s.count
        guard n > 1 else {
            return n
        }
        let chars = [Character](s)
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: n), count: n)
        (1..<n).forEach { dp[$0][$0] = 1 }
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
    
    private func check(_ s: String) -> Bool {
        let chars = [Character](s)
        let M = s.count
        for i in 0...(M >> 1) {
            guard chars[i] == chars[M - i - 1] else {
                return false
            }
        }
        return true
    }
}


