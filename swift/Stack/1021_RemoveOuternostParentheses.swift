//https://leetcode.com/problems/remove-outermost-parentheses/
class Solution {
    func removeOuterParentheses(_ S: String) -> String {
        var ans = ""
        var count = 0
        let leftParenrheses = Character("(")
        let rightParenrheses = Character(")")
        for ele in S {
            if ele == leftParenrheses {
                count += 1
                if count > 1 {
                    ans.append(ele)
                }
            }
            if ele == rightParenrheses {
                count -= 1
                if count >= 1 {
                    ans.append(ele)
                }
            }
        }
        return ans
    }
}