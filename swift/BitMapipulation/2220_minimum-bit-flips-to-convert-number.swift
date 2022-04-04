// https://leetcode.com/problems/minimum-bit-flips-to-convert-number/
class Solution1 {
    func minBitFlips(_ start: Int, _ goal: Int) -> Int {
        var ans = 0
        var s = start
        var g = goal
        while s > 0 || g > 0 {
            if (s & 1) != g & 1 {
                ans += 1
            }
            s = s >> 1
            g = g >> 1
        }
        return ans
    }
}
class Solution {
    func minBitFlips(_ start: Int, _ goal: Int) -> Int {
        return (start ^ goal).nonzeroBitCount
    }
}