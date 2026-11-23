    // https://leetcode.cn/problems/maximize-consecutive-elements-in-an-array-after-modification/
    class Solution {
        func maxSelectedElements(_ nums: [Int]) -> Int {
            let sortedNums = nums.sorted()
            var lengthWhenEndWithX = [Int:Int]()
            var ans = 1
            for x in sortedNums {
                lengthWhenEndWithX[x + 1] = (lengthWhenEndWithX[x] ?? 0) + 1
                lengthWhenEndWithX[x] = (lengthWhenEndWithX[x - 1] ?? 0) + 1
            }

            return lengthWhenEndWithX.values.max()!
        }
    }
