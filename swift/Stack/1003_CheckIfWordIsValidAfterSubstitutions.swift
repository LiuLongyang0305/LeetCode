//https://leetcode.com/problems/check-if-word-is-valid-after-substitutions/
class Solution {
    func isValid(_ S: String) -> Bool {
        var stack = [Character]()
        let endChar = Character("c")
        for ele in S {
            stack.append(ele)
            if ele == endChar {
                let length = stack.count
                guard length >= 3 else {
                    return false
                }
                if String(stack[(length - 3)..<length]) == "abc" {
                    stack.removeLast(3)
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}