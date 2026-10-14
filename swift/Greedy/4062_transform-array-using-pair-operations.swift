    //https://leetcode.cn/problems/transform-array-using-pair-operations/
    class Solution {
        func canTransform(_ source: [Int], _ target: [Int]) -> Bool {
            let M = source.count
            var diff = 0
            for i in 0..<M {
                diff += (source[i] - target[i])
            }
            return diff == 0
        }
    }
