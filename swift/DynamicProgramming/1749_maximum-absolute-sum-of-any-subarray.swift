// https://leetcode.com/problems/maximum-absolute-sum-of-any-subarray/
class Solution {
    func maxAbsoluteSum(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        let N = nums.count
        guard N > 1 else {
            return abs(nums[0])
        }
        var lastMax = nums[0]
        var lastMin = nums[0]
        var ans = abs(nums[0])
        for idx in 1..<N {
            lastMax = max(lastMax + nums[idx], nums[idx])
            lastMin = min(lastMin + nums[idx], nums[idx])
            ans = max(ans, abs(lastMin),abs(lastMax))
        }
        return ans
    }
}