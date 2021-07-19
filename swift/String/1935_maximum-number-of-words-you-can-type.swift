 // https://leetcode.com/problems/maximum-number-of-words-you-can-type/
class Solution {
    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        var brokenWords = 0
        let words = text.split(separator: " ")
        let brokenLettersSet = Set<Character>(brokenLetters)
        for word in words {
            for ch in word {
                if brokenLettersSet.contains(ch)  {
                    brokenWords += 1
                    break
                }
            }
        }
        return words.count - brokenWords
    }
}