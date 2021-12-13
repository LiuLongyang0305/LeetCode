// https://leetcode.com/problems/removing-minimum-and-maximum-from-array/
class Solution {
    func minimumDeletions(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            return nums.count
        }
        let maxValueIdx = nums.firstIndex(of: nums.max()!)!
        let minValueIdx = nums.firstIndex(of: nums.min()!)!
        let minIdx = min(maxValueIdx, minValueIdx)
        let maxIdx = max(maxValueIdx, minValueIdx)
        return  min(maxIdx + 1, nums.count - minIdx,minIdx + 1 + nums.count - maxIdx)

    }
}