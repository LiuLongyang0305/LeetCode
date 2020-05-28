// https://leetcode.com/problems/max-dot-product-of-two-subsequences/
class Solution {
    func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var ans = Int.min
        let M = nums1.count
        let N = nums2.count
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N + 1), count: M + 1)
        for i in 1...M {
            for j in 1...N {
                ans =  max(ans, dp[i - 1][j - 1] + nums1[i - 1] * nums2[j - 1])
                dp[i][j] = max(dp[i][j - 1], dp[i - 1][j],dp[i - 1][j - 1] + nums1[i - 1] * nums2[j - 1])
            }
        }
        return ans
    }
}

