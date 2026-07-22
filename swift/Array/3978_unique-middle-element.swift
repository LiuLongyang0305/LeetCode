    // https://leetcode.cn/problems/unique-middle-element/
class Solution {
    func isMiddleElementUnique(_ nums: [Int]) -> Bool {
        let target = nums[nums.count / 2]
        return nums.firstIndex(of: target)! == nums.lastIndex(of: target)!
    }
}
