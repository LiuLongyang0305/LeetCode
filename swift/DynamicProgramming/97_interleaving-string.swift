// https://leetcode.com/problems/interleaving-string/
class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let M = s1.count
        let N = s2.count
        let T = s3.count
        guard M + N == T else {
            return false
        }
        let s1Chars = [Character](s1)
        let s2Chars = [Character](s2)
        let s3Chars = [Character](s3)

        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N + 1), count: M + 1)
        dp[0][0] = true
        for i in 0...M {
            for j in 0...N {
                let p = i + j - 1
                if i > 0 {
                    dp[i][j] =  dp[i][j] || dp[i - 1] [j] && s1Chars[i - 1] == s3Chars[p]
                }
                if j > 0 {
                    dp[i][j] =  dp[i][j] || dp[i] [j - 1] && s2Chars[j - 1] == s3Chars[p]

                }
            }
        }
        return dp[M][N]
    }
}

