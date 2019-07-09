//https://leetcode.com/problems/score-of-parentheses/submissions/
class Solution {
    func scoreOfParentheses(_ S: String) -> Int {
        var ans = 0
        var balance = 0
        let leftParentheses = Character("(")
        let SToArray = Array<Character>(S)
        for i in 0..<S.count {
            if  SToArray[i] == leftParentheses {
                balance += 1
            } else {
                balance -= 1
                if SToArray[i - 1] == leftParentheses {
                    ans += 1 << balance
                }
            }
        }
        return ans
    }
}

class Solution2 {
    func scoreOfParentheses(_ S: String) -> Int {
        var stack = Array<Int>()
        stack.append(0)
        let leftParentheses = Character("(")
        for ele in S {
            if ele == leftParentheses {
                stack.append(0)
            } else {
                let v = stack.removeLast()
                let w = stack.removeLast()
                stack.append(w + max(2 * v, 1))
            }
        }
        return stack.removeLast()
    }
}