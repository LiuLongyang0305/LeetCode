    //https://leetcode.cn/problems/maximum-students-on-a-single-bench/
    class Solution {
        func maxStudentsOnBench(_ students: [[Int]]) -> Int {
            var counter = [Int:Set<Int>]()
            for s in students {
                counter[s[1],default: []].insert(s[0])
            }

            return counter.values.map { $0.count}.max() ?? 0
        }
    }
