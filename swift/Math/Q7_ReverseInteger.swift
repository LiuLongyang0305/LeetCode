//https://leetcode.com/problems/reverse-integer/
class Solution {
    func reverse(_ x: Int) -> Int {
        var ans = 0
        var  temp = abs(x)
        var tempArr = [Int]()
        while temp > 0 {
            ans = 10 * ans + temp % 10
            temp /= 10
            
        }
        if x < 0 {
            ans *= -1
        }
        if ans < Int32.min || ans > Int32.max {
            return 0
        }
        return ans
    }
}

Solution().reverse(1234)