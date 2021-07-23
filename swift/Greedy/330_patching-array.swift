// https://leetcode.com/problems/patching-array/
class Solution {
    func minPatches(_ nums: [Int], _ n: Int) -> Int {
        var ans = 0
        var x = 1
        let length = nums.count
        var idx = 0
        while x <= n {
            if idx < length && nums[idx] <= x {
                x += nums[idx]
                idx += 1
            } else {
                x *= 2
                ans += 1
            }
        }
        return ans
    }
}

