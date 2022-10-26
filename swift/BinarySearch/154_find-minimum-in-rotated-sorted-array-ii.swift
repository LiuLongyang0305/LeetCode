// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {return nums[0]}
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if nums[mid] < nums[right] {
                right = mid
            } else if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right -= 1
            }
        }
        return nums[left]
    }
}
