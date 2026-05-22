//https://leetcode.cn/problems/longest-non-decreasing-subarray-after-replacing-at-most-one-element/
class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        let N = nums.count
        guard N > 1 else {return 1}

        var sb = 2
        var suffix = [Int](repeating: 1, count: N)
        for i in stride(from: N - 2, to: 0, by: -1) {
            if nums[i] <= nums[i + 1] {
                suffix[i] = suffix[i + 1] + 1
                sb = max(sb,suffix[i] + 1)
            } else {
                suffix[i] = 1
            }
        }
        var pre = 1
        for i in stride(from: 1, to: N - 1, by: 1) {
            if nums[i - 1] <= nums[i + 1] {
                sb = max(sb, pre + 1 + suffix[i + 1])
            }
            if nums[i - 1] <= nums[i] {
                pre += 1
                sb = max(sb,pre + 1)
            } else {
                pre = 1
            }
        }
        return sb
    }
}
