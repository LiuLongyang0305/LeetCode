    //https://leetcode.cn/problems/minimum-adjacent-swaps-to-partition-array/
    class Solution {
        func minAdjacentSwaps(_ nums: [Int], _ a: Int, _ b: Int) -> Int {
            var ans = 0
            var cnt1 = 0
            var cnt2 = 0
            for x in nums {
                if x < a {
                    ans += cnt1 + cnt2
                } else if x <= b {
                    ans += cnt2
                    cnt1 += 1
                } else {
                    cnt2 += 1
                }
                ans %= 1_000_000_007
            }
            return ans % 1_000_000_007
        }
    }
