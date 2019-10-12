// https://leetcode.com/problems/generate-parentheses/
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var ans = [String]()
        if n == 0 {
            ans.append("")
        } else {
            for i in 0..<n {
                for left in generateParenthesis(i) {
                    for right in generateParenthesis(n - 1 - i) {
                        ans.append("(" + left + ")" + right)
                    }
                }
            }
        }
        return ans
    }
}