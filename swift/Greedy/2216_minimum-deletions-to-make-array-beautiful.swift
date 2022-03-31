// https://leetcode.com/problems/minimum-deletions-to-make-array-beautiful/
class Solution {
    func minDeletion(_ nums: [Int]) -> Int {
        var ans = 0
        let N = nums.count
        var idx = 0
        while idx + 1 < N {
            if nums[idx] == nums[idx + 1] {
                ans += 1
                idx += 1
            } else {
                idx += 2
            }
        }
        return ans + N - idx
    }
}