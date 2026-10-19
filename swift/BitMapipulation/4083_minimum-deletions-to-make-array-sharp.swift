//https://leetcode.cn/problems/minimum-deletions-to-make-array-sharp/
class Solution {
    func minDeletions(_ nums: [Int]) -> Int {
        var cnt = 0
        var last = nums[0]
        for num in nums.dropFirst() {
            if num == last {
                cnt += 1
            } else {
                last = num
            }
        }
        return cnt
    }
}
