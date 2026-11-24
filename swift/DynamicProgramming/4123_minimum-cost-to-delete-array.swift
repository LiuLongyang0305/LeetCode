    //https://leetcode.cn/problems/minimum-cost-to-delete-array/
    class Solution {
        private let INF = Int.max / 2
        func minCost(_ nums: [Int]) -> Int {
            var ans = nums.first! + nums.last!

            var f0 = 0
            var f1 = INF
            for x in nums.dropFirst().dropLast() {
                let newF0 = min(f0,f1 + x)
                f1 = min(f1,f0 + x)
                f0 = newF0
            }
            return ans + f0
        }
    }
