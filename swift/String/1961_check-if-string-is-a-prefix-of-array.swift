// https://leetcode.com/problems/check-if-string-is-a-prefix-of-array/
class Solution {
    func isPrefixString(_ s: String, _ words: [String]) -> Bool {
        var ans = ""
        for word in words {
            ans.append(word)
            guard ans != s else {
                return true
            }
        }
        return false
    }
}