    // https://leetcode.cn/problems/find-the-maximum-length-of-valid-subsequence-iii/
    class Solution {
        func maximumLength(_ nums: [Int], _ k: Int) -> Int {
            let M = nums.count
            var dp = [Int](repeating: 0, count: k + 5)
            var ans = 0
            for num in nums {
                let curR = num % k
                let preV = (k - curR) % k
                dp[curR] = dp[preV] + 1
                ans = max(ans,dp[curR])
            }
            return ans
        }
    }
