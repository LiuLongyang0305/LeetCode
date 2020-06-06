// https://leetcode.com/problems/generate-parentheses/
class Solution {
    var map = [Int:[String]]()
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {
            map[0] = [""]
            return [""]
        }
        if let parenthesis = map[n] {
            return parenthesis
        }
        var ans = [String]()
        
        for i in 0..<n {
            for left in generateParenthesis(i) {
                for right in generateParenthesis(n - 1 - i) {
                    ans.append("(" + left + ")" + right)
                }
            }
        }
        
        map[n] = ans
        return ans
    }
}