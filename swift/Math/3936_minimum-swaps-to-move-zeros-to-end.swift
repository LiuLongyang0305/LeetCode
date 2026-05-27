    // https://leetcode.cn/problems/minimum-swaps-to-move-zeros-to-end/
    class Solution {
        func minimumSwaps(_ nums: [Int]) -> Int {
            var cnt0 = 0
            for num in nums {
                if num == 0 {
                    cnt0 += 1
                }
            }

            guard cnt0 > 0 else {return 0}

            for num in nums.dropFirst(nums.count - cnt0) {
                if num == 0 {cnt0 -= 1}
            }
            return cnt0
        }

    }
