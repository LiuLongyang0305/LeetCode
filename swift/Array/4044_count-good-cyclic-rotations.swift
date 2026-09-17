    // https://leetcode.cn/problems/count-good-cyclic-rotations/
    class Solution {
        func countGoodRotations(_ nums: [Int]) -> Int {
            var preffix = [0] + nums
            let M = nums.count
            for i in 1...M {
                preffix[i] += preffix[i - 1]
            }
            let total = preffix.last!
            let half = M / 2
            var cnt = 0
            for startIdx in 0..<M {
                let right = startIdx - 1 + half
                if right < M {
                    let s = preffix[right + 1] - preffix[startIdx]
                    if 2 * s > total {
                        cnt += 1
                    }
                } else {
                    let left = startIdx - half
                    let s = total - (preffix[startIdx] - preffix[left])
                    if 2 * s > total {
                        cnt += 1
                    }
                }
            }
            return cnt
        }
    }
