// https://leetcode.com/problems/sentence-similarity-iii/
extension Array where Element == String {
    func hasPreffix(_ preffix: [String]) -> Bool {
        for idx in 0..<preffix.count {
            guard self[idx] == preffix[idx] else {
                return false
            }
        }
        return true
    }
    func hasSuffix(_ suffix: [String]) -> Bool {
        for idx in 0..<suffix.count {
            guard self[count - suffix.count + idx] == suffix[idx] else {
                return false
            }
        }
        return true
    }
}
class Solution {
    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        let wordsOfSentance1 = sentence1.split(separator: " ").map { String($0)}
        let wordsOfSentance2 = sentence2.split(separator: " ").map { String($0)}
        guard wordsOfSentance1.count != wordsOfSentance2.count else {
            return sentence1 == sentence2
        }
        
        return wordsOfSentance1.count < wordsOfSentance2.count ? check(wordsOfSentance2, wordsOfSentance1) : check(wordsOfSentance1, wordsOfSentance2)
    }
    private func check(_ long: [String], _ short: [String]) -> Bool {
        guard !long.hasSuffix(short)  && !long.hasPreffix(short) else {
            return true
        }
        var left = [String]()
        var right = short
        while !right.isEmpty {
            left.append(right.removeFirst())
            guard long.hasPreffix(left) else {
                continue
            }
            guard !long.hasSuffix(right) else {
                return true
            }
        }
        return false
    }
}