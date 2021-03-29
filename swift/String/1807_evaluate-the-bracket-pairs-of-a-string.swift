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

class Solution {
    func evaluate(_ s: String, _ knowledge: [[String]]) -> String {
        var ans = ""
        var map = [String:String]()
        for k in knowledge {
            map[k[0]] = k[1]
        }
        var leftIndex: String.Index? = nil
        var rightIndex: String.Index? = nil
        var idx = s.startIndex
        while idx < s.endIndex {
            if s[idx] == "(" {
                if let r = rightIndex {
                    ans.append(contentsOf: s[s.index(after: r)..<idx])
                } else {
                    ans.append(contentsOf: s[s.startIndex..<idx])
                }
                leftIndex = idx
            } else if s[idx] == ")" {
                let key = String(s[s.index(after: leftIndex!)..<idx])
                ans.append(map[key] ?? "?")
                rightIndex = idx
            }
            idx = s.index(after: idx)
        }
        if s[s.index(before: idx)] != ")" {
            if let r = rightIndex {
                ans.append(contentsOf: s[s.index(after: r)..<idx])
            } else {
                ans.append(contentsOf: s[s.startIndex..<idx])
            }
        }
        return ans
    }
}

