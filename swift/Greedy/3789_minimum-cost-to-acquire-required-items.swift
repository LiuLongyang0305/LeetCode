   // https://leetcode.com/problems/minimum-cost-to-acquire-required-items/
    class Solution {
        func minimumCost(_ cost1: Int, _ cost2: Int, _ costBoth: Int, _ need1: Int, _ need2: Int) -> Int {
            var sb = cost1 * need1 + cost2 * need2
            sb = min(sb,costBoth * max(need1, need2))
            if need1 >= need2 {
                sb = min(sb,need2 * costBoth + cost1 * (need1 - need2))
            } else {
                sb = min(sb,need1 * costBoth + cost2 * (need2 - need1))
            }
            return sb
        }
    }
