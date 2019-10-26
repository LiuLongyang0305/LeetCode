//https://leetcode.com/problems/uncrossed-lines/
class Solution {
    func maxUncrossedLines(_ A: [Int], _ B: [Int]) -> Int {
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: A.count), count: B.count)
        dp[0][0] = A[0] == B[0] ? 1 : 0
        for i in 1..<B.count {
            dp[i][0] = max(B[i] == A[0] ? 1 : 0, dp[i - 1][0])
        }
        for j in 1..<A.count {
            dp[0][j] = max(A[j] == B[0] ? 1 : 0, dp[0][j - 1])
        }
        for i in 1..<B.count {
            for j in 1..<A.count {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                if B[i] == A[j] {
                    dp[i][j] = max(dp[i][j], dp[i - 1][j - 1] + 1)
                }
            }
        }
        return dp[B.count - 1][A.count - 1]
    }
}