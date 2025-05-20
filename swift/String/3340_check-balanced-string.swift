// https://leetcode.com/problems/check-balanced-string/
class Solution {
    func isBalanced(_ num: String) -> Bool {
        var diff = 0
        var flag = true
        for ch in num {
            let t = Int(ch.asciiValue! - 48)
            diff += (flag ? 1 : -1) * t
            flag.toggle()
        }
        return diff == 0
    }
}