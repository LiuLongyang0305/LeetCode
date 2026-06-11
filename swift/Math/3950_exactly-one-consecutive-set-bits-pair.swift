//https://leetcode.cn/problems/exactly-one-consecutive-set-bits-pair/
    class Solution {
        func consecutiveSetBits(_ n: Int) -> Bool {
            var t = n
            var last = -1
            var cnt = 0
            while t > 0 {
                let cur = t & 1
                // print("cur = \(cur) l = \(last)")
                if cur + last == 2 {
                    cnt += 1
                }
                t = t >> 1
                last = cur
            }
            return cnt == 1
        }
    }
