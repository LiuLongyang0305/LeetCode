// https://leetcode.com/problems/minimum-number-of-operations-to-convert-time/
class Solution {
    func convertTime(_ current: String, _ correct: String) -> Int {
        let cur = Int(current.prefix(2))! * 60 + Int(current.suffix(2))!
        let goal = Int(correct.prefix(2))! * 60 + Int(correct.suffix(2))!
        var ans = 0
        var need = goal - cur
        for delta in [60,15,5,1] {
            ans += need / delta
            need %= delta
        }
        return ans
    }
}