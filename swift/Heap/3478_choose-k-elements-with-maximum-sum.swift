// https://leetcode.com/problems/choose-k-elements-with-maximum-sum/
class Solution {
    func findMaxSum(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        let N = nums1.count
        var ans = [Int](repeating: 0, count: N)
        let sortedIdx = (0..<N).sorted { nums1[$0] < nums1[$1]}
        var heap = Heap<Int>()
        var curSum = 0
        var lastIdx = -1
        for idx in 0..<N {
            ans[sortedIdx[idx]] = curSum
            if idx + 1 < N && nums1[sortedIdx[idx]] < nums1[sortedIdx[idx + 1]] {
                var j = idx
                while j > lastIdx {
                    heap.insert(nums2[sortedIdx[j]])
                    curSum += nums2[sortedIdx[j]]
                    if heap.count > k {
                        curSum -= (heap.popMin() ?? 0)
                    }
                    j -= 1
                }
                lastIdx = idx
            }

        }
        return ans
    }
}