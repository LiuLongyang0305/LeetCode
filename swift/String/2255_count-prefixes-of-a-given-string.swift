 // https://leetcode.com/problems/count-prefixes-of-a-given-string/
class Solution {
    func countPrefixes(_ words: [String], _ s: String) -> Int {
        return words.reduce(0) {$0 + (s.hasPrefix($1) ? 1 : 0)}
    }
}