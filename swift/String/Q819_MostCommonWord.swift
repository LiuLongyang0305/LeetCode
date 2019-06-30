//https://leetcode.com/problems/most-common-word/
class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        let banWords  = Set<String>(banned)
        var count = Dictionary<String,Int>()
        var maxCount = 0
        var targetWord = ""
        let sentences = paragraph.components(separatedBy: CharacterSet([".",",","!","?",";","'"]))
        for sentence in sentences {
            let words = sentence.split(separator: " ")
            for word in words {
                let wordCopy = String(word).lowercased()
                if !banWords.contains(wordCopy) {
                    if nil == count[wordCopy] {
                        count[wordCopy] = 1
                    } else {
                        count[wordCopy] = count[wordCopy]! + 1
                    }
                    if count[wordCopy]! > maxCount {
                        maxCount = count[wordCopy]!
                        targetWord = wordCopy
                    }
                }
            }
        }
        return targetWord
    }
}