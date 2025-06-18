// https://leetcode.cn/problems/apply-operations-to-make-all-array-elements-equal-to-zero
class Solution {
    func checkArray(_ nums: [Int], _ k: Int) -> Bool {
        let N = nums.count
        var delta = [Int](repeating: 0, count: N + 1)
        var preSum = 0
        for i in 0..<N {
            preSum += delta[i]
            if nums[i] - preSum == 0 {continue}
            if nums[i] > preSum {

                guard N - i >= k else {
                    return false
                }
                delta[i] += nums[i] - preSum
                delta[i + k] -= nums[i] - preSum
                preSum = nums[i]

            } else {
                return false
            }
        }
        return true
    }
}
