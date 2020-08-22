// https://leetcode.com/problems/rearrange-words-in-a-sentence/
class Solution {
    func arrangeWords(_ text: String) -> String {
        let words = text.lowercased().split(separator: " ").map { String($0)}
        var sortedWords = words.sorted { (s1, s2) -> Bool in
            s1.count < s2.count
        }
        sortedWords[0] = sortedWords[0].capitalized
        return sortedWords.joined(separator: " ")
    }
}