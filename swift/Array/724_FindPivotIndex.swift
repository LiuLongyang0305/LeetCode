//https://leetcode.com/problems/find-pivot-index/
class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return -1
        }
        if nums.count == 2 {
            return nums[0] == nums[1] ? 1 : -1
        }
        var leftSum = 0
        var rightSum = 0
        for num in nums {
            rightSum += num
        }
        for i  in 0..<nums.count {
            rightSum -= nums[i]
            if leftSum == rightSum {
                return i
            }
            leftSum += nums[i]
        }
        return -1
    }
}