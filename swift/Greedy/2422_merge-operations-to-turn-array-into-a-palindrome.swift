// https://leetcode.com/problems/merge-operations-to-turn-array-into-a-palindrome/
class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        var ans = 0

        while left <= right   {
            guard nums[left] != nums[right] else {
                left += 1
                right -= 1
                continue
            }
            var ls = nums[left],rs = nums[right]
            left += 1
            right -= 1
            while left <= right && ls != rs {
                ans += 1
                if ls < rs {
                    ls += nums[left]
                    left += 1
                } else {
                    rs += nums[right]
                    right -= 1
                }
            }
            if ls != rs {
                ans += 1
            }
        }

        return ans
    }
}