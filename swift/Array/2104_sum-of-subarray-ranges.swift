// https://leetcode.com/problems/sum-of-subarray-ranges/
class Solution {
    func subArrayRanges(_ nums: [Int]) -> Int {
        var ans = 0
        let N = nums.count
        for i in 0..<N {
            var m = nums[i]
            var n = nums[i]
            var j = i + 1
            while j < N {
                m = max(m,nums[j])
                n = min(n, nums[j])
                ans += m - n
                j += 1
            }
        }
        return ans
    }
}