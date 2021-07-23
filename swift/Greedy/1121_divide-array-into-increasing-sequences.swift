//https://leetcode.com/problems/divide-array-into-increasing-sequences/
class Solution {
    func canDivideIntoSubsequences(_ nums: [Int], _ k: Int) -> Bool {
        var pre = nums[0]
        var cnt = 0
        for num in nums {
            if num == pre {
                cnt += 1
            } else {
                pre = num
                cnt = 1
            }
            guard cnt * k <= nums.count else {
                return false
            }
        }
        return true
    }
}