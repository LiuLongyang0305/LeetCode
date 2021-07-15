// https://leetcode.com/problems/count-pairs-in-two-arrays/
class Solution {
    func countPairs(_ nums1: [Int], _ nums2: [Int]) -> Int {
        guard nums2.count > 1 else {
            return 0
        }
        let N = nums2.count
        var cnt = 0
        let sortedSub = (0..<N).map { nums1[$0] - nums2[$0]}.sorted()
//        print(sortedSub)
        for smallIdx in 0..<N {
            let target = -sortedSub[smallIdx] + 1
            if let idx = binarySearch(sortedSub, target) {
                let fromIdx = max(smallIdx + 1, idx)
                if fromIdx <= N - 1 {
                    cnt += N - fromIdx
                }
            }
        }
        return cnt
    }
    //第一个大于等于target的数
    func binarySearch(_ sortedNums: [Int], _ target: Int) -> Int? {
        guard target > sortedNums.first! else {
            return 0
        }
        guard target <= sortedNums.last! else {
            return nil
        }
        var left = 0
        var right = sortedNums.count - 1
        while left < right {
            let mid = (right + left) >> 1
            if sortedNums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}