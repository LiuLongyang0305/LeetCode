// https://leetcode.com/problems/get-the-maximum-score/
class Solution {
    func maxSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var ans = 0
        let intersectionNode = Set<Int>(nums1).intersection(nums2).sorted()
        let M = nums1.count
        let N = nums2.count
        var i = 0
        var j = 0
        var k = 0
        var first = 0
        var second = 0
        while  k < intersectionNode.count {
            let cur = intersectionNode[k]
            while nums1[i] < cur && i < M  {
                first += nums1[i]
                i += 1
            }
            while nums2[j] < cur && j < N  {
                second += nums2[j]
                j += 1
            }
            ans += max(first, second) + cur
            first = 0
            second = 0
            i += 1
            j += 1
            k += 1
        }
        while  i < M  {
            first += nums1[i]
            i += 1
        }
        while j < N  {
            second += nums2[j]
            j += 1
        }
        ans += max(first, second)
        return ans % 1_000_000_007
    }
}


