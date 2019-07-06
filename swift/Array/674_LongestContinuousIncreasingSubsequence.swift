//https://leetcode.com/problems/longest-continuous-increasing-subsequence/
class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var maxCount = 0
        var count = 1
        for i in 0..<(nums.count - 1) {
            if nums[i] < nums[i + 1] {
                count += 1
            } else {
                if maxCount < count {
                    maxCount = count
                }
                count = 1
            }
        }
        return  max(count, maxCount)
    }
}