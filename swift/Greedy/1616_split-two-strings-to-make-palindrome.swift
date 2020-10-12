// https://leetcode.com/problems/split-two-strings-to-make-palindrome/
class Solution {
    func isPalindrome(_ s: [Character], _ left: Int, _ right: Int) -> Bool {
        var i = left
        var j = right
        while i < j {
            if s[i] != s[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
    private func check(_ a: [Character], _ b: [Character]) -> Bool {
        var i = 0
        var j = a.count - 1
        while i < j {
            if a[i] != b[j] {
                return isPalindrome(a, i, j) || isPalindrome(b, i, j)
            }
            i += 1
            j -= 1
        }
        return true
    }
    func checkPalindromeFormation(_ a: String, _ b: String) -> Bool {
        let aChars = [Character](a)
        let bChars = [Character](b)
        return check(aChars,bChars ) || check(bChars, aChars)
    }
}

