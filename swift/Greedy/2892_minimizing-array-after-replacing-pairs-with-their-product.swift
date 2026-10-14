    // https://leetcode.cn/problems/minimizing-array-after-replacing-pairs-with-their-product/
    class Solution {
        func minArrayLength(_ nums: [Int], _ k: Int) -> Int {
            if nums.contains(0) {return 1}
            var copy = nums
            var merges = 0
            let N = nums.count
            for i in stride(from: 0, to: N - 1, by: 1) {
                if copy[i] * copy[i + 1] <= k {
                    copy[i + 1] *= copy[i]
                    merges += 1
                }
            }
            return nums.count - merges
        }
    }
