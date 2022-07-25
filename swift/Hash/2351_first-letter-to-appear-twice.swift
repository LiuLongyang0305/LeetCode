 // https://leetcode.com/problems/first-letter-to-appear-twice/
class Solution {
    func repeatedCharacter(_ _s: String) -> Character {
        var s = Set<Character>()
        for ch in _s {
            if s.contains(ch) {
                return ch
            }
            s.insert(ch)
        }
        return " "
    }
}