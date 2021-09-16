// https://leetcode.com/problems/reverse-prefix-of-word/
class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        guard let idx = word.firstIndex(of: ch) else {
            return word
        }
        return String([Character](word[...idx]).reversed()) + String(word[word.index(after: idx)...])
    }
}