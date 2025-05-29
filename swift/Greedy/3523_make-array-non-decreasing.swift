//https://leetcode.com/problems/make-array-non-decreasing
class Solution {
    func maximumPossibleSize(_ nums: [Int]) -> Int {

        var ans = 0
        var last = -1
        for num in nums {
            if num >= last {
                ans += 1
                last = num
            }
        }
        return ans
    }
}
