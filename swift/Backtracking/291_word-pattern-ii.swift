// https://leetcode.com/problems/word-pattern-ii/
class Solution {
    func wordPatternMatch(_ pattern: String, _ s: String) -> Bool {
        return backtracking(pattern, s, [:],[])
    }
    private func backtracking(_ pattern: String, _ s: String, _ dictionary: [Character:String], _ words: Set<String>) -> Bool {
        //print("p = \(pattern)  s = \(s)")
        guard !pattern.isEmpty && !s.isEmpty else {
            return pattern.isEmpty && s.isEmpty
        }
        guard pattern.count <= s.count else {
            return false
        }
        var (p,str,map,existedWords) = (pattern,s,dictionary,words)
        let next = p.removeFirst()
        if let word = dictionary[next] {
            guard str.hasPrefix(word) else {
                return false
            }
            str.removeFirst(word.count)
            return backtracking(p, str, dictionary,existedWords)
        } else {
            var left = ""
            while str.count > p.count {
                left.append(str.removeFirst())
                guard !existedWords.contains(left) else {
                    continue
                }
                map[next] = left
                existedWords.insert(left)
                guard !backtracking(p, str, map, existedWords) else {
                    return true
                }
                map.removeValue(forKey: next)
                existedWords.remove(left)
            }
            return false
        }
    }
}
