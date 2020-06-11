//https://leetcode.com/problems/ternary-expression-parser/
class Solution {
    func parseTernary(_ expression: String) -> String {
        var stack = [Character]()
        var flag = false
        for ch in expression.reversed() {
            if ch.isNumber {
                stack.append(ch)
            } else if ch == "?" {
                flag = true
            } else if ch == "T" || ch == "F"{
                if flag {
                    flag = false
                    if ch == "F" {
                        stack.removeLast()
                    } else {
                        stack.remove(at: stack.count - 2)
                    }
                } else {
                    stack.append(ch)
                }
            }
            
        }
        return "\(stack[0])"
    }
}
