// https://leetcode.com/problems/find-the-middle-index-in-array/
class Solution {
    func findMiddleIndex(_ nums: [Int]) -> Int {
        let total = nums.reduce(0) { $0 + $1}
        var left = 0
        let M = nums.count
        for i in 0..<M {
            if left == total - nums[i] - left {
                return i
            }
            left += nums[i]
        }
        return -1
    }
}