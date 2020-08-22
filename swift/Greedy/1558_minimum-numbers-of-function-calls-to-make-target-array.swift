// https://leetcode.com/problems/minimum-numbers-of-function-calls-to-make-target-array/
class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var ans = 0
        let target = Array<Int>(repeating: 0, count: nums.count)
        var numsCopy = nums
        while numsCopy != target {
            var cnt = [0,0]
            for num in numsCopy {
                cnt[num % 2] += 1
            }
            if cnt[1] == 0 {
                ans += 1
                numsCopy = numsCopy.map({ $0 >> 1})
            } else {
                numsCopy = numsCopy.map({ $0 % 2 == 1 ? ($0 - 1) : $0})
                ans += cnt[1]
            }
        }
        return ans
    }
}