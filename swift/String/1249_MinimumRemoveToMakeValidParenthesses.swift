//https://leetcode.com/contest/weekly-contest-161/problems/minimum-remove-to-make-valid-parentheses/
class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var leftParentheses = Array<Int>()
        var charsLeft = Array<Bool>(repeating: true, count: s.count)
        var chars = [Character](s)
        for i in 0..<s.count {
            if chars[i] == "(" {
                leftParentheses.append(i)
            } else if chars[i] == ")" {
                if leftParentheses.isEmpty {
                    charsLeft[i]  = false
                } else {
                    leftParentheses.popLast()
                }
            }
        }
        for i in 0..<leftParentheses.count {
            charsLeft[leftParentheses[i]] = false
        }

        var  ans = ""
        for i in 0..<chars.count {
            if charsLeft[i] {
                ans.append(chars[i])
            }
        }
        return ans
    }
}