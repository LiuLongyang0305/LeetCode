// https://leetcode.com/problems/find-n-unique-integers-sum-up-to-zero/
class Solution {
     func sumZero(_ n: Int) -> [Int] {
        guard n > 1 else {
            return [0]
        }
        var ans = Array<Int>(repeating: 0, count: n)
        
        for i in 1...(n >> 1) {
            ans[i - 1] = i
            ans[ n - i ] = -i
        }
        return ans
     }
 }


