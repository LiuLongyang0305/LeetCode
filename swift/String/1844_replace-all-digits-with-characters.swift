// https://leetcode.com/problems/replace-all-digits-with-characters/
class Solution {
    func replaceDigits(_ s: String) -> String {
        var chars = [Character](s)
        for idx in 0..<chars.count {
            if idx & 1 == 1 {
                chars[idx] = Character.init(Unicode.Scalar.init(chars[idx - 1].asciiValue! + chars[idx].asciiValue! - 48))
            }
        }
        return String(chars)
    }
}