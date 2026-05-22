// https://leetcode.cn/problems/minimum-deletion-cost-to-make-all-characters-equal/
    class Solution {
        func minCost(_ s: String, _ cost: [Int]) -> Int {
            let totalCost = cost.reduce(0) { $0 + $1}
            var i = 0
            var chToCost = [Character:Int]()
            for ch in s {
                chToCost[ch,default: 0] += cost[i]
                i += 1
            }
            return totalCost - chToCost.values.max()!
        }
    }
