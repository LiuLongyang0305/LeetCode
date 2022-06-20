 // https://leetcode.com/problems/greatest-english-letter-in-upper-and-lower-case/
class Solution {
    private let lower = [Character]("abcdefghijklmnopqrstuvwxyz")
    private let upper = [Character]("abcdefghijklmnopqrstuvwxyz".uppercased())
    func greatestLetter(_ s: String) -> String {
        var i = 25
        while i >= 0 {
            if s.contains(upper[i]) && s.contains(lower[i]) {
                return "\(upper[i])"
            }
            i -= 1
        }
        return ""
    }
}