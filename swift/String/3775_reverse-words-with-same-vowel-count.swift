
    //https://leetcode.cn/problems/reverse-words-with-same-vowel-count/
    class Solution {
        private let volews = Set<Character>("aeiou")
        func reverseWords(_ s: String) -> String {
            let words = s.split(separator: " ").map { String($0)}
            let target = countVowels(of: words[0])
            var sb = "\(words[0]) "
            for word in words.dropFirst() {
                if countVowels(of: word) == target {
                    sb += String(word.reversed())
                } else {
                    sb += word
                }
                sb.append(" ")
            }
            sb.removeLast()
            return sb
        }

        private func countVowels(of str: String) -> Int {
            var sb = 0
            for ch in str {
                if volews.contains(ch) {
                    sb += 1
                }
            }
            return sb
        }
    }
