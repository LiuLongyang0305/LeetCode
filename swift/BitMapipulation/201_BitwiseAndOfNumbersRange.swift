// https://leetcode.com/problems/bitwise-and-of-numbers-range/submissions/ 
class Solution {
     func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        guard n - m > 1 else {
            return m & n
        }
        let ans = n & (n - 1)
        guard ans >= m else {
            return ans
        }
        return rangeBitwiseAnd(m, ans)
     }
 }
 

