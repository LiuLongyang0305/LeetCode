//https://leetcode.com/problems/reach-end-of-array-with-max-score/
class Solution {
    func findMaximumScore(_ nums: [Int]) -> Int {
        var ans = 0
        var mx = nums[0]
        for i in 1..<nums.count {
            ans += mx
            mx = max(nums[i],mx)
        }
        return ans
    }
}
