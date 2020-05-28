// https://leetcode.com/problems/check-if-a-word-occurs-as-a-prefix-of-any-word-in-a-sentence/
class Solution {
    func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        let words = sentence.split(separator: " ").map {String($0)}
        for i in 0..<words.count {
            if words[i].hasPrefix(searchWord) {
                return i + 1
            }
        }
        return -1
    }
}