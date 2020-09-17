// https://leetcode.com/problems/max-consecutive-ones-ii/
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var ans = 0
        var dp0 = 0
        var dp1 = 0
        for i in 0..<nums.count {
            if 1 == nums[i] {
                dp0 += 1
                dp1 += 1
            } else {
                dp1 = dp0 + 1
                dp0 = 0
            }
            ans = max(dp1, dp0, ans)
        }
        return ans
    }
}
