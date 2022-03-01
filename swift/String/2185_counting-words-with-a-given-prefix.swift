// https://leetcode.com/problems/2/
class Solution {
    func prefixCount(_ words: [String], _ pref: String) -> Int {
        return words.reduce(0) {$0 + ($1.hasPrefix(pref) ? 1 : 0)}
    }
}