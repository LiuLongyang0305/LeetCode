    // https://leetcode.cn/problems/number-of-student-replacements/
    class Solution {
        func totalReplacements(_ ranks: [Int]) -> Int {
            var cnt = 0
            var last = ranks[0]
            for r in ranks.dropFirst() {
                if r < last {
                    cnt += 1
                    last = r
                }
            }
            return cnt
        }
    }
