// https://leetcode.cn/problems/maximum-unique-subarray-sum-after-deletion
class Solution {
    func maxSum(_ nums: [Int]) -> Int {
        let t = Set(nums).reduce(0) { $0 + max(0,$1)}
        return  t == 0 ? nums.max()! : t
    }
}