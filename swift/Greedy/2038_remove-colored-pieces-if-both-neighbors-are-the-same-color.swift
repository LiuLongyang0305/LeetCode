// https://leetcode.com/problems/remove-colored-pieces-if-both-neighbors-are-the-same-color/
class Solution {
    func winnerOfGame(_ colors: String) -> Bool {
        guard colors.count >= 3 else {return false}
        let colorsChars = [Character](colors)
        var cnt = 0
        let M = colors.count
        var idx = 1
        while idx < M - 1 {
            if colorsChars[idx] == colorsChars[idx - 1] && colorsChars[idx] == colorsChars[idx + 1] {
                cnt +=  (colorsChars[idx] == "A" ? 1 : -1)
            }
            idx += 1
        }
        return cnt > 0
    }
}