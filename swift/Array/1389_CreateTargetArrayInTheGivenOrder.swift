// https://leetcode.com/problems/create-target-array-in-the-given-order/
class Solution {
    func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
        var ans = Array<Int>()
        for i in 0..<nums.count {
            ans.insert(nums[i], at: index[i])
        }
        return ans
    }
}