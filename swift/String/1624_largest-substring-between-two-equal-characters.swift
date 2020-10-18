 // https://leetcode.com/problems/largest-substring-between-two-equal-characters/
class Solution {
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var ans = -1
        var map = [Character:Int]()
        let chars = [Character](s)
        for i in 0..<chars.count {
            if let idx = map[chars[i]] {
                ans = max(ans, i - idx - 1)
            } else {
                map[chars[i]] = i
            }
        }
        return ans
    }
}