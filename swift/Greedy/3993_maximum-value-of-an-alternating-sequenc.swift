// https://leetcode.cn/problems/maximum-value-of-an-alternating-sequence/
class Solution {
    func maximumValue(_ n: Int, _ s: Int, _ m: Int) -> Int {
        return s + n / 2 * (m - 1) + (n == 1 ? 0 : 1)
    }
}

