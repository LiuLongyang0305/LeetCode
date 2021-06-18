// https://leetcode.com/problems/largest-palindrome-product/
class Solution {
    private let powerOfTen = [1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000]
    private let MOD = 1337
    func largestPalindrome(_ n: Int) -> Int {
        guard n > 1 else {
            return 9
        }
        let lowLimit = powerOfTen[n - 1]
        let highLimit = powerOfTen[n] - 1
        var num = highLimit
        while num >= lowLimit {
            let palindromeNum = getPalindromeNumber(of: num)
            var factor = highLimit
            while factor * factor >= palindromeNum {
                if palindromeNum % factor == 0 {
                    return palindromeNum % MOD
                }
                factor -= 1
            }
            num -= 1
        }
        return -1
    }
    
    private func getPalindromeNumber(of leftPart: Int) -> Int {
        var ans = leftPart
        var temp = leftPart
        while temp > 0 {
            ans = 10 * ans + temp % 10
            temp /= 10
        }
        return ans
    }
}

