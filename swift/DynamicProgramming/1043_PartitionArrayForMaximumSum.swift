// https://leetcode.com/problems/partition-array-for-maximum-sum/
class Solution {
     func maxSumAfterPartitioning(_ A: [Int], _ K: Int) -> Int {
        var dp = Array<Int>(repeating: 0, count: A.count + 1)
        for i in 1...A.count {
            var maxTemp = A[i - 1]
            for j in 1...K {
                if i -  j >= 0 {
                    maxTemp = max(maxTemp, A[i - j])
                    dp[i] = max(dp[i], dp[i -  j] + j *  maxTemp)
                }
            }
        }
        return dp[A.count]
     }
 }