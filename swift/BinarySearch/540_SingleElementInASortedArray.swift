// https://leetcode.com/problems/single-element-in-a-sorted-array/
class Solution {
    private var nums = [Int]()
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        self.nums = nums
        return singleNonDuplicate(0, right: nums.count - 1)
    }
    private func singleNonDuplicate(_ left: Int, right: Int) -> Int {
        guard left != right else {
            return nums[left]
        }
        guard nums[left] == nums[left + 1] else {
            return nums[left]
        }
        guard nums[right] == nums[right - 1] else {
            return nums[right]
        }
        let mid = left + (right - left) >> 1
        if nums[mid] != nums[mid - 1] && nums[mid] != nums[mid + 1] {
            return nums[mid]
        }
        if nums[mid] == nums[mid - 1] {
            if (mid - left + 1) % 2 != 0 {
                return singleNonDuplicate(left, right: mid)
            } else {
                return singleNonDuplicate(mid + 1, right: right)
            }
        }
        return (right - mid + 1) % 2 != 0 ? singleNonDuplicate(mid, right: right) : singleNonDuplicate(left, right: mid - 1)
    }
}

