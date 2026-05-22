 //https://leetcode.cn/problems/minimum-operations-to-transform-array/
    class Solution {
        func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
            var sb = 1
            let target = nums2.last!
            var minDiff = Int.max
            let M = nums1.count

            for i in 0..<M {
                let x = min(nums1[i],nums2[i])
                let y = max(nums1[i],nums2[i])
                sb += y - x
                minDiff = min(minDiff,getDiff(y, x, target))
            }
            sb += minDiff
            return sb
        }

        private func getDiff(_ y: Int, _ x: Int, _ target: Int) -> Int {
            if target >= x && target <= y {return 0}
            if target < x {return x - target}
            return target - y
        }
    }
