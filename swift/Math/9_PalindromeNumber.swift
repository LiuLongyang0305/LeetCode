//https://leetcode.com/problems/palindrome-number/
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if x < 10 {
            return true
        }
        let intToString = "\(x)"
        let intToArray = Array<Character>(intToString)
        var i = 0
        var j = intToString.count - 1
        while i < j {
            if intToArray[i] != intToArray[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}