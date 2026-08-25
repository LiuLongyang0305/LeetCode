// https://leetcode.cn/problems/count-valid-prefixes/
    class Solution {
        func countValidPrefixes(_ s: String) -> Int {
            var diff = 0
            var sb = 0
            for ch in s {
                diff += (ch == "0" ? 1 : -1)
                if diff >= -1 && diff <= 1 {
                    sb += 1
                }
            }
            return sb
        }
    }
