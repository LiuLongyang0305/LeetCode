// https://leetcode.com/problems/minimum-operations-to-make-the-array-increasing/
class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var cnt = 0
        var last = -1
        for num in nums {
            if num <= last {
                cnt += last + 1 - num
                last = last + 1
            } else {
                last = num
            }
        }
        return cnt
    }
}

