 //https://leetcode.com/problems/house-robber-ii/
 class Solution {
    private func rob(_ nums: [Int],_ low: Int, _ high: Int) -> Int {
        var include = 0
        var exclude = 0
        for i in low...high {
            (exclude,include) = (max(include, exclude), exclude + nums[i])
        }
        return max(include, exclude)
    }
     func rob(_ nums: [Int]) -> Int {
        let N = nums.count
        guard N > 1 else {
            return N == 0 ? 0 : nums[0]
        }
        return max(rob(nums, 0, N - 2), rob(nums, 1, N - 1))
     }
 }
