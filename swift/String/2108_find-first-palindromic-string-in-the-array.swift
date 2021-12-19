// https://leetcode.com/problems/find-first-palindromic-string-in-the-array/
class Solution{
    func firstPalindrome(_ words: [String]) -> String {
        for word in words {
            if isPalindrome(word) {
                return word
            }
        }
        return ""
    }
    
    private func isPalindrome(_ word: String) -> Bool {
        guard !word.isEmpty else {
            return true
        }
        let chars = [Character](word)
        var i = 0
        var j = word.count - 1
        while i < j {
            guard chars[i] == chars[j] else {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}