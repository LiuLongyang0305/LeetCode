// https://leetcode.com/problems/equal-sum-arrays-with-minimum-number-of-operations/
class Solution {
    func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let nums1Sum = nums1.reduce(0) { $0 + $1}
        let nums2Sum = nums2.reduce(0) { $0 + $1}
        guard nums1Sum != nums2Sum else {
            return 0
        }
        if nums1Sum < nums2Sum {
            return helper(nums1, nums2, nums2Sum - nums1Sum)
        }
        return helper(nums2, nums1,nums1Sum - nums2Sum)
    }
    private func helper(_ less: [Int],_ greater: [Int],_ _diff: Int) -> Int {
        var frequency = Array<Int>(repeating: 0, count: 6)
        less.forEach { frequency[6 - $0] += 1 }
        greater.forEach { frequency[$0 - 1] += 1 }
        var diff = _diff
        var ans = 0
        var i = 5
        while i >= 1 && diff > 0 {
            while frequency[i] > 0 && diff > 0 {
                ans += 1
                frequency[i] -= 1
                diff -= i
            }
            i -= 1
        }
        return diff > 0 ? -1 : ans
    }
}