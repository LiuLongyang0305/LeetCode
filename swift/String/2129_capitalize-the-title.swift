// https://leetcode.com/problems/capitalize-the-title/
class Solution {
    func capitalizeTitle(_ title: String) -> String {
        var ans = ""
        let words = title.split(separator: " ").map { String($0).lowercased()}
        for  word in words {
            if word.count < 3 {
                ans.append(word)
            } else {
                ans.append(word.capitalized)
            }
            ans.append(" ")
        }
        ans.removeLast()
        return ans
    }
}