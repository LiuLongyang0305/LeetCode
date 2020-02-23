// https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/
class Solution {
    func numberOfSteps (_ num: Int) -> Int {
        var ans = 0
        var temp = num
        while temp > 0 {
            ans += 1
            if temp % 2 == 0 {
                temp = temp >> 1
            } else {
                temp -= 1
            }
        }
        return ans
    }
 }


