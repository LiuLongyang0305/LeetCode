// https://leetcode.com/problems/find-the-highest-altitude/
class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var cur = 0
        var ans = 0
         for height in gain {
            cur += height
            ans = max(ans, cur)
        }
        return ans
    }
}

