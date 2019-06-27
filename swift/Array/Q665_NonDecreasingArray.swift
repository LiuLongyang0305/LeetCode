//https://leetcode.com/problems/non-decreasing-array/
class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        var decreaseIndex = [Int]()
        for i in 0..<nums.count - 1 {
            if nums[i] > nums[i + 1] {
                decreaseIndex.append(i + 1)
            }
        }
        print(decreaseIndex)
        if decreaseIndex.count == 0 {
            return true
        } else if decreaseIndex.count > 1 {
            return false
        } else {
            let index = decreaseIndex[0]
            if index == 0 || index == nums.count - 2 {
                return true
            }
            return nums[index + 1] >= nums[index - 1] || nums[index] > nums[index - 2]
        }
    }
}