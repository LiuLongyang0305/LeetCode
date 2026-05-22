  //https://leetcode.cn/problems/minimum-operations-to-make-array-non-decreasing/
    class Solution {
        func minOperations(_ nums: [Int]) -> Int {
            var sb = 0
            var curMax = 0
            var delta = 0
            for num in nums {
                if num + delta >= curMax {
                    curMax = num + delta
                    continue
                }
                sb += curMax - num - delta
                delta += curMax - num - delta

            }
            return sb
        }
    }
