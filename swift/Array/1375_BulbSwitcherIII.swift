// https://leetcode.com/problems/bulb-switcher-iii/ 
class Solution {
    func numTimesAllBlue(_ light: [Int]) -> Int {
        var maxBubNUmber = 0
        var ans = 0
        for i in 0..<light.count {
            maxBubNUmber = max(maxBubNUmber, light[i])
            if maxBubNUmber == i + 1 {
                ans += 1
            }
        }
        return ans
    }
 }

