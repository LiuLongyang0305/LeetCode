//https://leetcode.cn/problems/minimum-operations-to-maximize-last-elements-in-array
class Solution {
    private let INF = Int.max / 2
    func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let ans = min(ope(nums1, nums2, nums1.last!, nums2.last!), 1 + ope(nums1, nums2, nums2.last!, nums1.last!))
        return ans == INF ? -1 : ans
    }

    private func ope(_ nums1: [Int], _ nums2:[Int], _ max1: Int, _ max2: Int) -> Int {
        var ans = 0
        let N = nums1.count
        for i in 0..<(N - 1) {
            if nums1[i] <= max1 && nums2[i] <= max2 {
                continue
            } else {
                guard nums2[i] <= max1 && nums1[i] <= max2 else {return INF}
                ans += 1
            }

        }
        return ans
    }
}
