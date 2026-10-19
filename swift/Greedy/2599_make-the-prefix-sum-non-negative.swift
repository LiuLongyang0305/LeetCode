    // https://leetcode.cn/problems/make-the-prefix-sum-non-negative/
    class Solution {
        func makePrefSumNonNegative(_ nums: [Int]) -> Int {
            var heap = Heap<Int>()
            var cnt = 0
            var preSum = 0
            for num in nums {
                preSum += num
                if num < 0 {
                    heap.insert(-num)
                }
                if preSum < 0 {
                    preSum += heap.popMax()!
                    cnt += 1
                }
            }
            return cnt
        }
    }
