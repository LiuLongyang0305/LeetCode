 // https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words/
class Solution {
    func longestPalindrome(_ words: [String]) -> Int {
        var ans = 0
        var counter = [String:Int]()
        words.forEach {counter[$0,default: 0] += 1}
        var visitedWords = Set<String>()
        var existPalindromeWord = false
        let words = [String](counter.keys)
        for word in words {
            guard !visitedWords.contains(word) else {continue}
            visitedWords.insert(word)
            let palindromeWord = String(word.reversed())
            guard palindromeWord != word else {
                let c = counter[word]!
                ans += 4 * (c >> 1)
                if c % 2 == 1 {
                     existPalindromeWord = true
                }
               
                continue
            }
            visitedWords.insert(palindromeWord)
            ans += 4 * min(counter[word] ?? 0, counter[palindromeWord] ?? 0)
        }
        return ans + (existPalindromeWord ? 2 : 0)
    }
}
