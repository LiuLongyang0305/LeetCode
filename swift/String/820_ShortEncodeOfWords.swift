// https://leetcode.com/problems/short-encoding-of-words/
 class Solution {
    func minimumLengthEncoding(_ words: [String]) -> Int {
        let sortedWords = words.sorted {$0.count < $1.count}
        var contains = Array<Bool>(repeating: true, count: words.count)
        for i in 0..<(sortedWords.count - 1) {
            for j in (i + 1)..<words.count {
                if sortedWords[j].hasSuffix(sortedWords[i]) {
                    contains[i] = false
                    break
                }
            }
        }
        var totalSum = 0
        for i in 0..<words.count {
            if contains[i] {
                totalSum += sortedWords[i].count +  1
            }
        }
        return totalSum
    }
 }
