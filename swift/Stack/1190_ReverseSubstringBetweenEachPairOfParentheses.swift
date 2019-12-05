// https://leetcode.com/problems/reverse-substrings-between-each-pair-of-parentheses/
class Solution {
     func reverseParentheses(_ s: String) -> String {
        var ans = ""
        var stack = [Character]()
        for ch in s {
            if ch.isLetter && stack.isEmpty {
                ans.append(ch)
            } else if ch.isLetter || ch == "(" {
                stack.append(ch)
            } else if ch == ")"  {
                let index = stack.lastIndex(of: "(")!
                let chars = String(stack[(index + 1)...]).reversed()
                if index  ==  0 {
                    ans.append(contentsOf: chars)
                    stack = []
                }  else {
                    let count = stack.count - index
                    stack.removeLast(count)
                    stack.append(contentsOf: chars)
                }
            }
        }
         return ans
     }
 }