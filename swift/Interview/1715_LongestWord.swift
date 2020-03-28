// https://leetcode-cn.com/problems/longest-word-lcci/
class Solution {
    func longestWord(_ words: [String]) -> String {
        guard words.count > 1 else {
            return ""
        }
        let wordsSortedByCount = words.sorted { (s1, s2) -> Bool in
            if s1.count == s2.count {
                return s1 < s2
            }
            return s1.count > s2.count
        }
        var wordsCanBeBuilt = Set<String>(words)
        var wordsCanNotBeBuilt = Set<String>()
        func dfs(_ word: String) -> Bool {
            guard !wordsCanBeBuilt.contains(word) else {
                return true
            }
            guard !wordsCanNotBeBuilt.contains(word) else {
                return false
            }
            for w in  wordsCanBeBuilt where w.count < word.count{
                if word.hasPrefix(w)  {
                    var tempWord = word
                    tempWord.removeFirst(w.count)
                    if dfs(tempWord) {
                        wordsCanBeBuilt.insert(tempWord)
                        return true
                    }
                }
                if word.hasSuffix(w) {
                    var tempWord = word
                    tempWord.removeLast(w.count)
                    if dfs(tempWord) {
                        wordsCanBeBuilt.insert(tempWord)
                        return true
                    }
                }
            }
            wordsCanNotBeBuilt.insert(word)
            return false
        }
        for word in wordsSortedByCount {
            wordsCanBeBuilt.remove(word)
            if dfs(word) {
                return word
            }
            wordsCanBeBuilt.insert(word)
        }

        return ""
    }
}
