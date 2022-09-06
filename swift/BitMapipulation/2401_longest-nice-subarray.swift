// https://leetcode.com/problems/longest-nice-subarray/
class Solution {
    func longestNiceSubarray(_ nums: [Int]) -> Int {

        var ans = 1
        let N = nums.count
        var left = 0
        var right = 0
        var mask = 0
        while left < N {
            while  right < N && mask & nums[right] == 0 {
                mask |= nums[right]
                right += 1
            }
            ans = max(ans, right - left)
            mask ^= nums[left]
            left += 1
        }

        return ans
    }
}
