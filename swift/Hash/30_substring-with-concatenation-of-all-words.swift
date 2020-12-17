// https://leetcode.com/problems/substring-with-concatenation-of-all-words/
class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let wordLength = words[0].count
        let wordsLength = words.count
        let totalWordsLength = wordLength * wordsLength
        let sourceLength = s.count
        guard s.count >= totalWordsLength else {
            return []
        }
        var wordsCounter = [String:Int]()
        words.forEach {wordsCounter[$0,default: 0] += 1}
        var ans = [Int]()
        let splitWords = getSplitWords(s, wordLength)
        func check(start idx: Int) -> Bool {
            var counter = [String:Int]()
            for i in stride(from: idx, through: totalWordsLength + idx - 1, by: wordLength)  {
                guard let _ = wordsCounter[splitWords[i]] else {
                    return false
                }
                counter[splitWords[i], default: 0] += 1
            }
            return counter == wordsCounter
        }
        for idx in 0...(sourceLength - totalWordsLength) {
            if check(start: idx) {
                ans.append(idx)
            }
        }
        return ans
    }
    
    private func getSplitWords(_ s: String, _ wordLength: Int) -> [String] {
        var ans = [String]()
        var tempWord = String(s.prefix(wordLength))
        ans.append(tempWord)
        for ch in s.suffix(from: s.index(s.startIndex, offsetBy: wordLength)) {
            tempWord.append(ch)
            tempWord.removeFirst()
            ans.append(tempWord)
        }
        return ans
    }
}