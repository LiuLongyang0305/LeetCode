//https://leetcode.com/problems/find-peak-element/
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count  >  2 else {
            return nums[0] < nums.last! ? nums.count -  1 : 0
            
        }
        for i in 1..<(nums.count - 1) {
            if nums[i] - nums[i - 1] > 0 &&  nums[i] - nums[i + 1] > 0 {
                return i
            }
        }
        
        return nums[0] < nums.last! ? nums.count -  1 : 0
    }
}

class Solution2 {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left  = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) >> 1
            if nums[mid] > nums[mid + 1] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
