// https://leetcode.com/problems/number-of-strings-that-appear-as-substrings-in-word/
class Solution {
    func numOfStrings(_ patterns: [String], _ word: String) -> Int {
        return patterns.reduce(0) {$0 + (word.contains($1) ? 1 : 0 )}
    }
}