// https://leetcode.com/problems/minimize-product-sum-of-two-arrays/
class Solution {
    func minProductSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let sortedNums1 = nums1.sorted { $0 > $1}
        let sortedNums2 = nums2.sorted { $0 < $1}
        return (0..<nums2.count).reduce(0) {$0 + sortedNums1[$1] * sortedNums2[$1]}
    }
}
