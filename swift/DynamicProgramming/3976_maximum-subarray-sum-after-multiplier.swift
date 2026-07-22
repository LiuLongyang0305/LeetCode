    // https://leetcode.cn/problems/maximum-subarray-sum-after-multiplier/
class Solution {
    func maxSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        return max(solve(nums, k, true),solve(nums, k, false))
    }
    private func solve(_ nums: [Int], _ k: Int, _ isMul: Bool) -> Int {
        var f0 = 0
        var f1 = 0
        var f2 = 0
        var sb = Int.min
        for x in nums {
            let y = isMul ? (x * k) : (x / k)
            f2 = max(f1,f2) + x
            f1 = max(f0,f1,0) + y
            f0 = max(f0,0) + x
            sb = max(f0,f1,f2,sb)
        }
        return sb
    }
}
