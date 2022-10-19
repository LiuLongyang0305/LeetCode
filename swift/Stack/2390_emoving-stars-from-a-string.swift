// https://leetcode.com/problems/removing-stars-from-a-string/
class Solution {
    func removeStars(_ s: String) -> String {

        var ans = ""
        for ch in s {
            if ch.isLetter {
                ans.append(ch)
            } else {
                ans.removeLast()
            }
            // print(ans)
        }
        return ans
    }
}