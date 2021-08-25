// https://leetcode.com/problems/minimum-time-to-type-word-using-special-typewriter/
class Solution {
    func minTimeToType(_ word: String) -> Int {
        var ans = 0
        var last: Character = "a"
        for ch in word {
            let delta = abs(Int(ch.asciiValue!) - Int(last.asciiValue!))
            ans += min(delta,26 - delta) + 1
            last = ch
        }
        return ans
    }
}