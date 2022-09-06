// https://leetcode.com/problems/strictly-palindromic-number/
class Solution {
    func isStrictlyPalindromic(_ n: Int) -> Bool {
        for i in 2...(n - 2) {
            guard isPalindrome(getStr(of: n, i)) else {return false}
        }
        return true
    }

    private func  getStr(of num: Int, _ base: Int) -> String {
        var ans = ""
        var t = num
        while t > 0 {
            ans.append("\(t % base)")
            t /= base
        }
        return ans
    }
    private func isPalindrome(_ str: String) -> Bool {
        return String(str.reversed()) == str
    }
}
