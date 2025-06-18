//https://leetcode.com/problems/ways-to-split-array-into-good-subarrays/
class Solution {
    func numberOfGoodSubarraySplits(_ nums: [Int]) -> Int {
        guard nums.contains(1) else {return 0}
        var ans = 1
        var lastOne = -1
        var i = 0

        while i < nums.count {
            if nums[i] == 1 {
                if lastOne != -1 {
                    let cntZero = i - lastOne - 1
                    ans *= (cntZero + 1)
                    ans %= 1_000_000_007
                }
                lastOne = i
            }
            i += 1
        }
        return ans
    }
}
