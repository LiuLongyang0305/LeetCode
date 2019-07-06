//https://leetcode.com/problems/plus-one/
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        if digits[0] < 8 && digits.count == 1{
            return [digits[0] + 1]
        }
        var result = digits
        let size = digits.count
        if digits[size - 1] != 9 {
            result[size - 1] = digits[size - 1] + 1
            return result
        }
        var j = size - 1
        var carry = 1
        while j >= 0 && carry == 1{
            if digits[j] == 9 {
                result[j] = 0
            } else {
                result[j] = digits[j] + 1
                carry = 0
            }
            j -= 1
        }
        if carry == 1 {
            result.insert(1, at: 0)
        }
        return result
    }
}