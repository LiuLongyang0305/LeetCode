 //https://leetcode.com/problems/find-numbers-with-even-number-of-digits/
 extension Int {
    var digitsCount: Int {
        switch self {
        case 1...9:
            return 1
        case 10...99:
            return 2
        case 100...999:
            return 3
        case 1000...9999:
            return 4
        case 10000...99999:
            return 5
        default:
            return  6
        }
    }
 }
 extension Int {
    var digitsCount2: Int {
        if self >= 1 && self < 10 {
            return  1
        } else if self < 100 {
            return 2
        } else if self < 1000 {
            return 3
        } else if self < 10000 {
            return 4
        } else if self < 100000{
            return 5
        }
        return 6
    }
 }
 
 class Solution {
     func findNumbers(_ nums: [Int]) -> Int {
        var ans =  0
        for num in nums {
            if num.digitsCount % 2 == 0 {
                ans += 1
            }
        }
        return ans
     }
 }