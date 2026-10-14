    // https://leetcode.cn/problems/maximum-number-of-equal-length-runs/
    class Solution {
        func maxSameLengthRuns(_ s: String) -> Int {
            var map = [Int:Int]()
            let chars = [Character](s)
            let M = chars.count

            var i = 0
            var j = 0

            while i < M {
                while j < M && chars[j] == chars[i] {
                    j += 1
                }
                map[j - i,default: 0] += 1
                i = j
            }

            return map.values.max() ?? -1
        }
    }
