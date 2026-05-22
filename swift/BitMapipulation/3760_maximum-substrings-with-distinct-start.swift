 //https://leetcode.cn/problems/maximum-substrings-with-distinct-start/
    class Solution {
        func maxDistinct(_ s: String) -> Int {
            var mask = 0
            for ch in s {
                mask |= (1 << Int(ch.asciiValue! - 97))
            }
            return mask.nonzeroBitCount
        }
    }
