//https://leetcode.com/problems/moving-stones-until-consecutive/
class Solution {
    func numMovesStones(_ a: Int, _ b: Int, _ c: Int) -> [Int] {
        let first = min(a, b, c)
        let last = max(a, b, c)
        let second = a +  b + c - first  - last
        let delta1 = second - first
        let delta2 = last - second
        if delta1 == 1 && delta2 == 1 {
            return [0,0]
        }
        if delta1 <= 2 || delta2 <= 2  {
            return [1,delta2 +  delta1 -  2]
        }
        return [2,delta2 +  delta1 -  2]
    }
 }