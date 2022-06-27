// https://leetcode.com/problems/maximum-score-of-spliced-array/
class Solution {
    func maximumsSplicedArray(_ nums1: [Int], _ nums2: [Int]) -> Int {
        return max(solve(nums1, nums2), solve(nums2, nums1))
    }
    private func solve(_ nums1:[Int], _ nums2: [Int]) -> Int {
        let N = nums1.count
        let total = nums1.reduce(0) { $0 + $1}
        let delta = (0..<N).map { nums2[$0] - nums1[$0]}
        var preffixMin = 0
        var deltaMax = 0
        var pre = 0
        for num in delta {
            pre += num
            deltaMax = max(deltaMax, pre - preffixMin)
            preffixMin = min(preffixMin, pre)

        }
        return total + deltaMax
    }
}