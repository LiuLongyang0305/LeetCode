   // https://leetcode.cn/problems/maximum-product-of-two-integers-with-no-common-bits/
    class Solution {
        func maxProduct(_ nums: [Int]) -> Int {
            let mx = nums.max()!
            let w = 64 - mx.leadingZeroBitCount
            let u = 1 << w
            var memoState = [Int](repeating: -1, count: u)
            for x in nums {
                memoState[x] = x
            }
            for s in 0..<u{
                for bit in 0..<w {
                    if (s >> bit) & 1 != 0 {
                        memoState[s] = max(memoState[s],memoState[s ^ (1 << bit)])
                    }
                }
            }
            var sb = 0
            for num in nums {
                sb = max(sb,num * memoState[(u - 1) ^ num])
            }
            return sb
        }
    }
