// https://leetcode.com/problems/median-of-two-sorted-arrays/
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        let mid1 = (m + n + 1) >> 1
        let mid2 = (m + n + 2) >> 1
        return (findKth(nums1, 0, m, nums2, 0, n, mid1) + findKth(nums1, 0, m, nums2, 0, n, mid2)) / 2.0
    }
    private func findKth(_ nums1:[Int], _ s1:Int,_ m: Int,_ nums2:[Int], _ s2: Int,_ n: Int,_ k: Int) -> Double {
        guard m <= n else {
            return findKth(nums2, s2, n, nums1, s1, m, k)
        }
        guard m != 0 else {
            return Double(nums2[s2 + k - 1])
        }
        guard k != 1 else {
            return Double(min(nums2[s2], nums1[s1]))
        }
        let i = min(k / 2, m)
        let j = min(n, k / 2)
        if nums1[s1 + i - 1] < nums2[s2 + j - 1] {
            return findKth(nums1, s1 + i, m - i, nums2, s2, n, k - i)
        } else {
            return findKth(nums1, s1, m, nums2, s2 + j, n - j, k - j)
        }
    }
}