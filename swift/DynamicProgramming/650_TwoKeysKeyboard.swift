//https://leetcode.com/problems/2-keys-keyboard/
class Solution {
    func minSteps(_ n: Int) -> Int {
        var ans = 0
        var d = 2
        var temp = n
        while  temp > 1 {
            while temp % d == 0 {
                ans += d
                temp /= d
            }
            d += 1
        }
        return ans
    }
    
}

Solution().minSteps(3)