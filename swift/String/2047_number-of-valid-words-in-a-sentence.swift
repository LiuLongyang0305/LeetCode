// https://leetcode.com/problems/number-of-valid-words-in-a-sentence/
class Solution {
    private func check(token: String) -> Bool {
        guard !token.isEmpty else {return false}
        guard checkRule1(token: token) else {
            return false
        }
        guard checkRule2(token: token) else {
            return false
        }
        guard checkRule3(token: token) else {
            return false
        }
//        print(token)
        return true
    }
    private func checkRule1(token: String) -> Bool {
        for ch in token {
            guard !ch.isNumber else {
                return false
            }
        }
        return true
    }
    private func checkRule2(token: String) -> Bool {
        guard token.contains("-") else {
            return true
        }
        let firstIdx = token.firstIndex(of: "-")!
        let lastIdx = token.lastIndex(of: "-")!
        guard firstIdx == lastIdx else {
            return false
        }
        guard firstIdx != token.startIndex && firstIdx != token.index(before: token.endIndex) else {
            return false
        }
        guard token[token.index(before: firstIdx)].isLowercase && token[token.index(after: firstIdx)].isLowercase else {
            return false
        }
        return true
    }
    
    private func checkRule3(token: String) -> Bool {
        if !token.last!.isLowercase {
            return isWord(str: String(token.dropLast()))
        }
        return isWord(str: token)
    }
    private func isWord(str: String) -> Bool {
//        print("str = \(str)")
        for ch in str {
            guard ch.isLowercase || ch == "-" else {
                return false
            }
        }
        return true
    }
    func countValidWords(_ sentence: String) -> Int {
        var cnt = 0
        var token = ""
        for ch in sentence {
            if ch == " " {
                if check(token: token) {
                    cnt += 1
                }
                token = ""
            } else {
                token.append(ch)
            }
        }
        if check(token: token) {
            cnt += 1
        }
        return cnt
    }
}