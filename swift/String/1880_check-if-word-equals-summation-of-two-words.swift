// https://leetcode.com/problems/check-if-word-equals-summation-of-two-words/
class Solution {
    func isSumEqual(_ firstWord: String, _ secondWord: String, _ targetWord: String) -> Bool {
        return getNumber(of: firstWord) + getNumber(of: secondWord) == getNumber(of: targetWord)
    }
    private func getNumber(of numberString: String) -> Int {
        var ans = 0
        for ch in numberString {
            ans = 10 * ans + Int(ch.asciiValue! - 97)
        }
        return ans
    }
}

