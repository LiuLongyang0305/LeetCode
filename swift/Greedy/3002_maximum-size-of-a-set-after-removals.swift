//https://leetcode.com/problems/maximum-size-of-a-set-after-removals/

class Solution {
    func maximumSetSize(_ nums1: [Int], _ nums2: [Int]) -> Int {


        let M = nums1.count
        let limit = M / 2
        let set1 = Set(nums1)
        let set2 = Set(nums2)
        let commonElements = set1.intersection(set2)

        var cnt1 = 0
        for x in set1 {
            if cnt1 < limit && !set2.contains(x) {
                cnt1 += 1
            }
        }
        var cnt2 = 0
        for x in set2 {
            if cnt2 < limit && !set1.contains(x) {
                cnt2 += 1
            }
        }
        for x in commonElements {
            if cnt1 < limit {
                cnt1 += 1
            } else if cnt2 < limit  {
                cnt2 += 1
            }

        }
        return cnt1 + cnt2
    }
}



