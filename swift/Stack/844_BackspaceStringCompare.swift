//https://leetcode.com/problems/backspace-string-compare/
class Solution {
    let cancelKey = Character("#")
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        return build(source: T) == build(source: S)
    }
    private func build(source: String) -> [Character] {
        var stack = Array<Character>()
        for ele in source {
            if ele == cancelKey  {
                if  !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(ele)
            }
        }
        return stack
    }
}