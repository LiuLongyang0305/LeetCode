// https://leetcode-cn.com/problems/fan-zhuan-dan-ci-shun-xu-lcof/
class Solution {
    func reverseWords(_ s: String) -> String {
        let words = s.split(separator: " ").map { String($0)}
        var ans = ""
        for i in stride(from: words.count - 1, through: 0, by: -1) {
            if ans.isEmpty {
                ans += words[i]
            } else {
                ans += " \(words[i])"
            }
        }
        return ans
    }
}