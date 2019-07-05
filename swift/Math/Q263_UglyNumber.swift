
//https://leetcode.com/problems/ugly-number/
class Solution {
    
    func isUgly(_ num: Int) -> Bool {
        if num <= 0 {
            return false
        }
        if num < 7{
            return true
        }
        if num % 2 == 0 {
            return isUgly(num / 2)
        } else if num % 3 == 0 {
            return isUgly(num / 3)
        } else if num % 5 == 0 {
            return isUgly(num / 5)
        } else {
            return false
        }
    }
}

Solution().isUgly(-2147483648)