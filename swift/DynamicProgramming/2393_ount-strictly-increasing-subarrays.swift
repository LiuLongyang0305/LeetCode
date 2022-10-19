// https://leetcode.com/problems/count-strictly-increasing-subarrays/
class Solution {
    func countSubarrays(_ nums: [Int]) -> Int {
        var ans = 0
        var last = Int.max
        var cnt = 0
        for num in nums {
            if num <= last {
                cnt = 1
            } else {
                cnt += 1
            }
            last = num
            ans += cnt
        }
        return ans
    }
}