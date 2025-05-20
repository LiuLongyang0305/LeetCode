//https://leetcode.com/problems/maximum-difference-between-adjacent-elements-in-a-circular-array/
class Solution {
    func maxAdjacentDistance(_ nums: [Int]) -> Int {
        var ans = abs(nums.last! - nums.first!)
        for i in 1..<nums.count {
            ans = max(ans,abs(nums[i] - nums[i - 1]))
        }
        return ans
    }
}