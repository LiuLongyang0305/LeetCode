// https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/
class Solution {
    func check(_ nums: [Int]) -> Bool {
        let sortedNums = nums.sorted()
        guard sortedNums != nums else {
            return true
        }
        var idx = 1
        let N = nums.count
        while idx < N {
            guard nums[idx] >= nums[idx - 1] else {
                break
            }
            idx += 1
        }
        let rebuiltNums = [Int](nums[idx...]) + [Int](nums[..<idx])
        return rebuiltNums == sortedNums
    }
}

