//https://leetcode.com/problems/repeated-substring-pattern/
class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let str = s + s
        let subStr = String(str[str.index(after: str.startIndex)..<str.index(before: str.endIndex )])
        return subStr.contains(s)
    }
}