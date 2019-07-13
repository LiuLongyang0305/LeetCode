//https://leetcode.com/problems/reverse-words-in-a-string/
class Solution {
    
    func reverseWords(_ s: String) -> String {
        guard !s.isEmpty else {
            return ""
        }
        let parts = s.split(separator: " ")
        guard !parts.isEmpty else {
            return ""
        }
        guard parts.count != 1 else {
            return String(parts[0])
        }
        var j = parts.count - 1
        var ans = ""
        while j > 0 {
            ans += parts[j]
            ans.append(" ")
            j -= 1
        }
        ans += parts[0]
        return ans
    }
}
Solution().reverseWords("hello   word!")
