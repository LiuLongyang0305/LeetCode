// https://leetcode.com/problems/evaluate-the-bracket-pairs-of-a-string/
class Solution {
    func evaluate(_ s: String, _ knowledge: [[String]]) -> String {
        var ans = ""
        var map = [String:String]()
        for k in knowledge {
            map[k[0]] = k[1]
        }
        
        var idx = s.startIndex
        while idx < s.endIndex {
            if s[idx].isLetter {
                ans.append(s[idx])
            } else if s[idx] == "(" {
                var key = ""
                idx = s.index(after: idx)
                while s[idx] != ")" {
                    key.append(s[idx])
                    idx = s.index(after: idx)
                }
                ans.append(map[key] ?? "?")
            }
            idx = s.index(after: idx)
        }
        return ans
    }
}