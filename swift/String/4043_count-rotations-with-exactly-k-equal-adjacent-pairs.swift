    // https://leetcode.cn/problems/count-rotations-with-exactly-k-equal-adjacent-pairs/
    class Solution {
        func countRotations(_ s: String, _ k: Int) -> Int {
            let chars = [Character](s)
            let M = chars.count
            var totalPairCnt = 0
            for i in 1..<M {
                if chars[i] == chars[i - 1] {
                    totalPairCnt += 1
                }
            }
            var cnt = 0
            if totalPairCnt == k {
                cnt += 1
            }
            var curPairCnt = totalPairCnt + (chars[0] == chars[M - 1] ? 1 : 0)
            for i in 0..<(M - 1) {
                let t =  curPairCnt + ( chars[i] == chars[i + 1]  ? -1 : 0)
                if t == k {
                    cnt += 1
                }
            }
            return cnt
        }
    }
