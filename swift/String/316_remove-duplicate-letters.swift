// https://leetcode.com/problems/remove-duplicate-letters/
extension Array where Element == Int {
    func exist(largerThan value: Int) -> Bool {
        for ele in self {
            if ele > value {
                return true
            }
        }
        return false
    }
}

class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        let length = s.count
        var stack = Array<Character>()
        let chars = [Character](s)
        var charToIndices = [Character:[Int]]()
        for i in 0..<length {
            charToIndices[chars[i],default: []].append(i)
        }
        
        for i in 0..<length {
            let ch = chars[i]
            if stack.contains(ch) {
                continue
            }
            while !stack.isEmpty && ch < stack.last! && charToIndices[stack.last!]!.exist(largerThan: i){
                stack.removeLast()
            }
            stack.append(ch)
        }
        return String(stack)
    }
}

