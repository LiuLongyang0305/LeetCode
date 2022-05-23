// https://leetcode.com/problems/percentage-of-letter-in-string/
class Solution {
    func percentageLetter(_ s: String, _ letter: Character) -> Int {
        let cnt = s.reduce(0) { $0 + ($1 == letter ? 1 : 0)}
        return Int(Double(cnt) / Double(s.count) * 100)
    }
}