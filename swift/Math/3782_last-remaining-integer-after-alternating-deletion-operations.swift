   // https://leetcode.cn/problems/last-remaining-integer-after-alternating-deletion-operations/
    class Solution {
        func lastInteger(_ n: Int) -> Int {
            var start = 1
            var d = 1
            var t = n
            while t > 1 {
                start += (t - 2 + t % 2) * d
                d *= -2
                t = (t + 1) / 2
            }
            return start
        }
    }
