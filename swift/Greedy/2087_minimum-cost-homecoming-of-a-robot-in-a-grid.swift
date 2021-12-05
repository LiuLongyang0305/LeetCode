// https://leetcode.com/problems/minimum-cost-homecoming-of-a-robot-in-a-grid/
class Solution {
    func minCost(_ startPos: [Int], _ homePos: [Int], _ rowCosts: [Int], _ colCosts: [Int]) -> Int {
        guard startPos != homePos else {
            return 0
        }
        let disX = startPos[0] - homePos[0] 
        let disY =  startPos[1] - homePos[1] 
        var ans  = 0
        if disX < 0 {
            var r = startPos[0] + 1
            while r <= homePos[0] {
                ans += rowCosts[r]
                r += 1
            }
        } else {
           var r = startPos[0] - 1
            while r >= homePos[0] {
                ans += rowCosts[r]
                r -= 1
            }
        }
        if disY < 0 {
            var c = startPos[1] + 1
            while c <= homePos[1] {
                ans += colCosts[c]
                c += 1
            }
        } else {
            var c = startPos[1] - 1
            while c >= homePos[1] {
                ans += colCosts[c]
                c -= 1
            }
        }
        return ans
    }
}