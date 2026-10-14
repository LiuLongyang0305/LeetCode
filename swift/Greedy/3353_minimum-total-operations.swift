    // https://leetcode.cn/problems/minimum-total-operations/
    class Solution {
        func minOperations(_ nums: [Int]) -> Int {
            var sb = 0
            let M = nums.count
            for i in stride(from: M - 2, through: 0, by: -1) {
                if nums[i] != nums[i + 1] {
                    sb += 1
                }
            }
            return sb
        }
  }
