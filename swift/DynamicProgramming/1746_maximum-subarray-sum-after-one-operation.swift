// https://leetcode-cn.com/problems/maximum-subarray-sum-after-one-operation/
class Solution {
    func maxSumAfterOperation(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums[0] * nums[0]
        }
        
        var sum0: Int = nums[0]
        var sum1: Int = nums[0] * nums[0]
        var sum2: Int = Int.min
        
        var ans: Int = sum1
        let length = nums.count
        
        for idx in 1..<length {
            sum2 = max(sum2, sum1, 0) + nums[idx]
            sum1 = max(sum0, 0) + nums[idx] * nums[idx]
            sum0 = max(sum0, 0) + nums[idx]
            ans = max(ans, sum1, sum2)
        }
        return ans
    }
}
