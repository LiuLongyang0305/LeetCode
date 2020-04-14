//https://leetcode.com/problems/missing-element-in-sorted-array/
class Solution {
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        guard N > 1 else {
            return nums[0] + k
        }
        var remainMissingNumberCount = k
        for i in 1..<N {
            let delta = nums[i] - nums[i - 1] - 1
            if remainMissingNumberCount <= delta {
                return nums[i - 1] + remainMissingNumberCount
            }
            remainMissingNumberCount -= delta
        }
        
        return nums.last! + remainMissingNumberCount
    }
}

