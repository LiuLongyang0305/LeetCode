//https://leetcode.cn/problems/minimum-value-of-merged-integers/
class Solution {
    func minMergedInteger(_ nums: [Int]) -> Int {
        var ans = Int.max
        for fi in stride(from: 0, to: nums.count, by: 2) {
            let second = nums[fi + 1]
            var v = second
            var cur  = nums[fi]
            while v > 0 {
                cur *= 10
                v /= 10
            }
            ans = min(ans,cur + second)
        }
        return ans
    }
}
