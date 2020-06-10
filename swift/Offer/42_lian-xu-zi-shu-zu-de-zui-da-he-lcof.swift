// https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/
class Solution {
    private typealias Info = (included:Int,excluded: Int)
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums[0]
        }
        let N = nums.count
        var ans = nums[0]
        var dp = Array<Info>(repeating: (0,0), count: N)
        
        dp[0].included = nums[0]
        dp[0].excluded = 0
        
        for i in 1..<N {
            dp[i].included = max(nums[i], nums[i] + dp[i - 1].included)
            if i  == 1 {
                dp[i].excluded = nums[0]
            } else {
                dp[i].excluded = max(dp[i - 1].included, dp[i - 1].excluded)
            }
            ans = max(dp[i].included, dp[i].excluded)
        }
        return ans
    }
}