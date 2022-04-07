// https://leetcode.com/problems/guess-the-word/
/**
 * // This is the Master's API interface.
 * // You should not implement it, or speculate about its implementation
 * class Master {
 *     public func guess(word: String) -> Int {}
 * }
 */
class Solution {
    func findSecretWord(_ wordlist: [String], _ master: Master) {

        let M = 6
        var candicateWords = Set<String>(wordlist)

        var guessCnt = 0
        let limit = 10

        while guessCnt <= limit && !candicateWords.isEmpty {
            let cur = candicateWords.first!
            let overlap = master.guess(cur)
            guard overlap != M else {
                break
            }
            candicateWords.remove(cur)
            let guessWordChars = [Character](cur)
            for word in candicateWords {
                let wordChars = [Character](word)
                let matches = (0..<M).reduce(0) { $0 + (guessWordChars[$1] == wordChars[$1] ? 1 : 0)}
                if matches != overlap {
                    candicateWords.remove(word)
                }
            }
            guessCnt += 1
        }
    }
}