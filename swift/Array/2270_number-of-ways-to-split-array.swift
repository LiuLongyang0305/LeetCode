// https://leetcode.com/problems/number-of-ways-to-split-array/
class Solution {
    func waysToSplitArray(_ nums: [Int]) -> Int {

        let N = nums.count
        var ans = 0
        let total = nums.reduce(0) { $0 + $1}
        var sum = 0
        for i in 0..<(N - 1) {
            sum += nums[i]
            if sum >= total - sum {
                ans += 1
            }
        }


        return ans
    }
}