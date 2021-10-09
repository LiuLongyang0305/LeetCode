// https://leetcode.com/problems/minimum-moves-to-convert-string/
class Solution {
    func minimumMoves(_ s: String) -> Int {
        let N = s.count
        let chars = [Character](s)
        var idx = 0
        var ans = 0
        while idx < N {
            if chars[idx] == "O" {
                idx += 1
            } else {
                ans += 1
                idx += 3
            }
        }
        return ans
    }
}