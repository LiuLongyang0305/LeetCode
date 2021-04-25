// https://leetcode.com/problems/longest-substring-of-all-vowels-in-order/
class Solution {
    func longestBeautifulSubstring(_ word: String) -> Int {
        var ans = Int.min
        var l = word.startIndex
        var visited = Set<Character>()
        while l < word.endIndex {
            visited.insert(word[l])
            var r = word.index(after: l)
            var last = l
            while r < word.endIndex && word[r].asciiValue! >= word[last].asciiValue! {
                if !visited.contains(word[r]) {
                    visited.insert(word[r])
                }
                last = r
                r = word.index(after: r)
            }
            if visited.count == 5 {
                ans = max(ans, word.distance(from: l, to: r))
            }
            l = r
            visited = []
        }
        return max(ans, 0)
    }
}

