// https://leetcode.com/problems/goal-parser-interpretation/
class Solution {
    func interpret(_ command: String) -> String {
        var ans = ""
        var s = command
        while !s.isEmpty {
            if s.hasPrefix("G") {
                ans.append("G")
                s.removeFirst()
            } else if s.hasPrefix("()") {
                ans.append("o")
                s.removeFirst(2)
            } else if s.hasPrefix("(al)") {
                ans.append("al")
                s.removeFirst(4)
            }
        }
        return ans
    }
}