// https://leetcode.com/problems/water-bottles/
class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var ans = numBottles
        var leftBottles = numBottles
        while leftBottles >= numExchange {
            ans += leftBottles / numExchange
            leftBottles = leftBottles % numExchange + leftBottles / numExchange
        }
        return ans
    }
}
