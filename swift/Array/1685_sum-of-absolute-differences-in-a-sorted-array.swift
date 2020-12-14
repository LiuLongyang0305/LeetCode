// https://leetcode.com/problems/sum-of-absolute-differences-in-a-sorted-array/
class Solution {
    func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
        let total = nums.reduce(0) {$0 + $1}
        var ans = [Int]()
        var preSum = 0
        let N = nums.count
        for idx in 0..<N {
            ans.append((2 * idx - N) * nums[idx] - 2 * preSum  + total)
            preSum += nums[idx]
        }
        return ans
    }
}