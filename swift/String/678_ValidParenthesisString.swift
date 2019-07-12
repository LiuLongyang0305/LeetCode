//https://leetcode.com/problems/valid-parenthesis-string/

let leftParentheses: Character = "("
let rightParentheses: Character = ")"
let star: Character = "*"
class Solution {
    func checkValidString(_ s: String) -> Bool {
        
        var indicesOfLeftParenthes = [Int]()
        var indicesOfStar = [Int]()
        let arr = Array<Character>(s)
        var stack = [Character]()
        for i in 0..<s.count {
            let ch = arr[i]
            switch ch {
            case leftParentheses:
                stack.append(ch)
                indicesOfLeftParenthes.append(stack.count - 1)
            case rightParentheses:
                if indicesOfLeftParenthes.isEmpty && indicesOfStar.isEmpty {
                    return false
                }
                if !indicesOfLeftParenthes.isEmpty {
                    stack[indicesOfLeftParenthes.removeLast()] = " "
                    continue
                }
                if !indicesOfStar.isEmpty {
                    stack[indicesOfStar.removeLast()] = " "
                    continue
                }
            case star:
                stack.append(ch)
                indicesOfStar.append(stack.count - 1)
            default:
                break
            }
        }
        
        if indicesOfStar.count < indicesOfLeftParenthes.count {
            return false
        }
        let trimSpace = stack.filter { (ch) -> Bool in
            ch != " "
        }
        var tempStack = [Character]()
        for ch in trimSpace {
            if ch == leftParentheses {
                tempStack.append(ch)
                continue
            }
            if !tempStack.isEmpty {
               tempStack.removeLast()
            }
        }
        return tempStack.isEmpty
    }
}

Solution().checkValidString("(*)")
