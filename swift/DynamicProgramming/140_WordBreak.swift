// https://leetcode.com/problems/word-break-ii/submissions/ 
class Solution {
    private var memo : [String:[String]] = [:]
    private var words = [String]()
    func wordBreak(_ s: String, _ words: [String]) -> [String] {
        let sChars = Set<Character>(s)
        var wordChars = Set<Character>()
        words.forEach { (word) in
            word.forEach {wordChars.insert($0)}
        }
        self.words = words
        guard sChars.isSubset(of: wordChars) else {
            return []
        }
        return dfs(s)
    }
    
    private func dfs(_ s: String) -> [String] {
        guard nil == memo[s] else {
            return memo[s]!
        }
        var ans = [String]()
        guard !s.isEmpty else {
            ans.append("")
            return ans
        }
        for word in words {
            if s.hasPrefix(word) {
                let  subList = dfs(String(s[s.index(s.startIndex, offsetBy: word.count)...]))
                for str in subList {
                    ans.append(word + (str.isEmpty ? "" : " ") + str)
                }
            }
        }
        memo[s] = ans
        return ans
    }
 }