//https://leetcode.com/problems/merge-sorted-array/
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard 0 != m && 0 != n else {
            if m == 0 {
                nums1 = nums2
            }
            return
        }
        nums1.removeLast(nums1.count - m)
        
        if nums2[n - 1] <= nums1[0] {
            nums1.insert(contentsOf: nums2, at: 0)
            return
        }
        if nums2[0] >= nums1[m - 1] {
            nums1.append(contentsOf: nums2)
            return
        }
        var i = 0
        var k = n - 1
        while nums2[i] <= nums1[0] {
            i += 1
        }
        nums1.insert(contentsOf: nums2[0..<i], at: 0)
        
        while nums2[k] >= nums1.last! {
            k -= 1
        }
        nums1.append(contentsOf: nums2[(k + 1)..<n])

        if k >= i {
            var j = i
            for p in i...k {
                let ele = nums2[p]
                while ele > nums1[j] {
                    j += 1
                }
                nums1.insert(ele, at: j)
            }
        }
    }
}