    //https://leetcode.cn/problems/count-triplets-with-even-xor-set-bits-i/
    class Solution {
        func tripletCount(_ a: [Int], _ b: [Int], _ c: [Int]) -> Int {
            var cnt = 0
            for m in a {
                for n in b {
                    for p in c {
                        let t = m ^ n ^ p
                        if t.nonzeroBitCount & 1 == 0 {
                            cnt += 1
                        }
                    }
                }
            }
            return cnt
        }
    }
