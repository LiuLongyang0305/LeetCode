//https://leetcode.cn/problems/check-ascii-palindromic/

class Solution {
    func isPalindromic(_ _s: String) -> Bool {
        var s = ""
        for ch in _s {
            s += to8BitBinary(ch.asciiValue ?? 0)
        }

        return s == String(s.reversed())
    }
    private func to8BitBinary(_ number: UInt8) -> String {
        var str = String(number,radix: 2)
        if str.count < 8 {
            str = String(repeating: "0", count: 8 - str.count) + str
        }
        return str
    }
}
