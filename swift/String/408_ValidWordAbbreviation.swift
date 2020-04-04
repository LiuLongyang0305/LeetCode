// https://leetcode.com/problems/valid-word-abbreviation/
class Solution {
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        guard !abbr.hasPrefix("0") else {
            return false
        }
        var count = ""
        var ans = [Character]()
        for ch in abbr {
            if ch.isLetter {
                if let cnt = Int(count) {
                    guard cnt <= word.count else {
                        return false
                    }
                    ans.append(contentsOf: Array<Character>(repeating: "*", count: cnt))
                    count = ""
                }
                ans.append(ch)
            } else {
                if count.isEmpty {
                    guard ch != "0" else {
                        return false
                    }
                }
                count.append(ch)
            }
        }
        if let cnt = Int(count) {
            guard cnt <= word.count else {
                return false
            }
            ans.append(contentsOf: Array<Character>(repeating: "*", count: cnt))
        }
        guard word.count == ans.count else {
            return false
        }
        let originalChars = [Character](word)
        for i in 0..<word.count {
            if ans[i] != "*" {
                guard ans[i] == originalChars[i] else {
                    return false
                }
            }
        }
        return true
    }
}
