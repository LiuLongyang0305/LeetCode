//https://leetcode.com/problems/evaluate-reverse-polish-notation/
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        let operators: Set<String> = ["*","+","/","-"]
        var stack = Array<Int>()
        for token in tokens {
            if operators.contains(token) {
                let num1 = stack.removeLast()
                let index = stack.count - 1
                switch token {
                case "*":
                    stack[index] *= num1
                case "-":
                    stack[index] -= num1
                case "+":
                    stack[index] += num1
                case "/":
                    stack[index] /= num1
                default:
                    break
                }
                continue
            }
            stack.append(Int(token)!)
        }
        return stack[0]
    }
}
