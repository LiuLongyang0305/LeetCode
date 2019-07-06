
//https://leetcode.com/problems/count-numbers-with-unique-digits/
class Solution {
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }
        if n == 1 {
            return 10
        }
        let temp = n > 10 ? 10 : n
        
        var ans = 10
        for i in 2...temp {
            ans += getNDigitsDifferent(length: i)
        }
        return ans
    }
    
    private func getNDigitsDifferent(length: Int) -> Int {
        let chioce  = [9,9,8,7,6,5,4,3,2,1]
        var ans = 1
        for i in 0..<length {
            ans *= chioce[i]
        }
        return ans
    }
}

Solution().countNumbersWithUniqueDigits(2)