// https://leetcode.com/problems/minimum-sum-of-four-digit-number-after-splitting-digits/
class Solution {
    func minimumSum(_ num: Int) -> Int {
        var digits = [num % 10,num / 10 % 10, num / 100 % 10,num / 1000 % 10]
        digits.sort()
        return 10 * (digits[0] + digits[1]) + digits[2] + digits[3]
    }
}