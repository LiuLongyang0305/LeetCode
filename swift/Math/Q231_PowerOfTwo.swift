//https://leetcode.com/problems/power-of-two/
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
                if n < 2 {
            return n == 1
        }
        var temp = n
        while temp > 1 {
            if temp % 2 != 0 {
                return false
            }
            temp >>= 1
        }
        return true
    }
}
class Solution2 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        return (n&(n - 1)) == 0
    }
}