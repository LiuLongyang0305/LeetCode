//https://leetcode.com/problems/parsing-a-boolean-expression/
class Solution {
    let operators = Set<Character>("!|&")
    func parseBoolExpr(_ expression: String) -> Bool {
        var stack = Array<Character>()
        for ch in expression {
            if ch.isLetter || operators.contains(ch) {
                stack.append(ch)
            }
            if ch == ")" {
                var  temp = Set<Character>()
                while !operators.contains(stack.last!){
                    temp.insert(stack.removeLast())
                }
                switch stack.removeLast() {
                case "|":
                    if temp.count == 2 || (temp.count == 1 && temp.first! == "t") {
                        stack.append("t")
                    } else {
                        stack.append("f")
                    }
                case "&":
                    if temp.count == 2 || (temp.count == 1 && temp.first! == "f") {
                        stack.append("f")
                    } else {
                        stack.append("t")
                    }
                default:
                    stack.append(temp.first! == "t" ? "f" : "t")
                }
            }
        }
        return stack.first! == "t" ? true : false
    }
}