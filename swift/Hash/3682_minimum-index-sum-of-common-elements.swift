//https://leetcode.cn/problems/minimum-index-sum-of-common-elements/
class Solution {
    func minimumSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var numToIdx1 = [Int:Int]()
        var numToIdx2 = [Int:Int]()
        for j in  0..<nums1.count {
            if nil == numToIdx1[nums1[j]] {
                numToIdx1[nums1[j]] = j
            }
            if nil == numToIdx2[nums2[j]] {
                numToIdx2[nums2[j]] = j
            }
        }
        var sb = Int.max / 2
        for (v,i) in numToIdx1 {
            if let j = numToIdx2[v] {
                sb = min(sb,i + j)
            }
        }
        return sb == Int.max / 2 ? -1 : sb
    }
}
