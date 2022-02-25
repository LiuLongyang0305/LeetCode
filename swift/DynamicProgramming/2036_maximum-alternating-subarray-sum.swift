//https://leetcode.com/problems/maximum-alternating-subarray-sum/
class Solution {
    func maximumAlternatingSubarraySum(_ nums: [Int]) -> Int {
        
        guard nums.count > 1 else {return nums[0]}
        let N = nums.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: N + 5)
        dp[0][0] = nums[0]
        dp[0][1] = 0
        var ans = max(dp[0][1], dp[0][0])
        for idx in 1..<N {
            dp[idx][0] = max(nums[idx], dp[idx - 1][1] + nums[idx])
            dp[idx][1] = max(0, dp[idx - 1][0] - nums[idx])
            ans = max(ans, dp[idx][0],dp[idx][1])
        }
//        print(dp)
        return ans
    }
}
