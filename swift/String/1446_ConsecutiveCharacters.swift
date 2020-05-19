// https://leetcode.com/problems/consecutive-characters/
class Solution {
    func maxPower(_ s: String) -> Int {
        guard s.count > 1 else {
            return s.count
        }
        var ans = 1
        var cnt = 1
        let chars = [Character](s)
        let N = chars.count
        for i in 1..<N {
            cnt = chars[i] == chars[i - 1] ? (cnt + 1) : 1
            ans = max(ans, cnt)
        }
        return ans
    }
}