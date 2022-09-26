// https://leetcode.com/problems/longest-subarray-with-maximum-bitwise-and/
class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var ans = 1
        let N = nums.count
        let maxVal = nums.max()!
        var left = 0
        while left < N {
            guard nums[left] == maxVal else {
                left += 1
                continue
            }
            var right = left + 1
            while right < N && nums[right] == maxVal {
                right += 1
            }
            ans = max(ans, right - left)
            left = right + 1
        }
        return ans
    }
}