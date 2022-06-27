// https://leetcode.com/problems/count-asterisks/
class Solution {
    private let verticalBar: Character = "|"
    private let star: Character = "*"
    func countAsterisks(_ s: String) -> Int {
        var ans = 0
        var verticalBarCnt = 0
        for ch in s {
            if ch == star && verticalBarCnt & 1 == 0 {
                ans += 1
            }
            if ch == verticalBar {
                verticalBarCnt += 1
            }
        }
        return ans
    }
}