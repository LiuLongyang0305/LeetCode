// https://leetcode.com/problems/rearrange-spaces-between-words/
class Solution {
    func reorderSpaces(_ text: String) -> String {
        guard text.contains(" ") else {
            return text
        }
        var ans = ""
        let words = text.split(separator: " ")
        let N = text.count
        let spaceCnt = N - words.reduce(0) {$0 + $1.count}
        let wordsCnt = words.count

        guard wordsCnt > 1 else {
            return String(words[0]) + String(repeating: " ", count: spaceCnt)
        }
        let average = spaceCnt / (words.count - 1)
        let lastSpacesCnt = spaceCnt - average * (wordsCnt - 1)
        let spaces = String(repeating: " ", count: average)
        let lastSpaces = lastSpacesCnt > 0 ? String(repeating: " ", count: lastSpacesCnt) : ""
        for i in 0..<words.count {
            ans += String(words[i]) + (i == wordsCnt - 1 ? lastSpaces : spaces)
        }
        return ans
    }
}