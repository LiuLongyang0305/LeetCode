// https://leetcode.com/problems/angle-between-hands-of-a-clock/ 
class Solution {
     func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let angle = abs(Double(minutes * 6) - (Double(hour * 30) + 0.5 * Double(minutes)))
        return min(angle, 360.0 - angle)
     }
 }


