// https://leetcode.com/problems/rearrange-words-in-a-sentence/
class Solution {
    func arrangeWords(_ text: String) -> String {
        var ans = ""
        var words = text.split(separator: " ").map { String($0)}
        var firstWord = words[0]
        let ch = firstWord.removeFirst()
        let lowercaseedChar = Character.init(Unicode.Scalar.init(ch.asciiValue! + 32))
        firstWord.insert(lowercaseedChar, at: firstWord.startIndex)
        words[0] = firstWord
        var sortedWords = words.sorted { (str1, str2) -> Bool in
            return str1.count < str2.count
        }
        sortedWords[0] = sortedWords[0].capitalized
        ans = sortedWords.reduce(ans) {$0 + " " + $1}
        ans.removeFirst()
        return ans
    }
}