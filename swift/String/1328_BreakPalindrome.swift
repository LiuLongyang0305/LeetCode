 //https://leetcode.com/problems/break-a-palindrome/
 class Solution {
    func breakPalindrome(_ palindrome: String) -> String {
        guard palindrome.count > 1 else {
            return ""
        }
        var ans = [Character](palindrome)
        for i in 0..<(ans.count  >> 1) {
            if ans[i] != "a" {
                ans[i] = "a"
                return String(ans)
            }
        }
        ans[ans.count - 1] = "b"
        return String(ans)
    }
 }