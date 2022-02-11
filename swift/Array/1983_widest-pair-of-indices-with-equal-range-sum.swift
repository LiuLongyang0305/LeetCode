//  https://leetcode-cn.com/problems/widest-pair-of-indices-with-equal-range-sum/
class Solution {
    func widestPairOfIndices(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var preffixAndIndex = [Int:Int]()
        preffixAndIndex[0] = -1
        let N = nums1.count
        var ans = 0
        var sum = 0
        for idx in 0..<N {
            sum += nums1[idx] - nums2[idx]
            if let i = preffixAndIndex[sum] {
                ans = max(ans, idx - i)
            } else {
                preffixAndIndex[sum] = idx
            }
        }
        return ans
    }
}