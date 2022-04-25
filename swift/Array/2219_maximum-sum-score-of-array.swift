// https://leetcode.com/problems/maximum-sum-score-of-array/
class Solution {
    func maximumSumScore(_ nums: [Int]) -> Int {
        let total = nums.reduce(0) { $0 + $1}
        var ans = Int.min
        var cur = 0
        for num in nums {
            cur += num
            ans = max(ans, cur, total - cur + num)
        }
        return ans
    }
}