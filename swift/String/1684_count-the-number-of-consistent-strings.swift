// https://leetcode.com/problems/count-the-number-of-consistent-strings/
class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        let allowSet = Set<Character>(allowed)
        return words.reduce(0) { $0 + (Set<Character>($1).isSubset(of: allowSet) ? 1 : 0)}
    }
}