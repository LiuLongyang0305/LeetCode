// https://leetcode.cn/problems/count-subarrays-where-max-element-appears-at-least-k-times/
class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        let target = nums.max()!
        var ans = 0
        var cnt = 0
        var l = 0
        var r = 0
        let N = nums.count
        while l <  N {
            while cnt < k && r < N {
                if nums[r] == target {
                    cnt += 1
                }
                r += 1
            }
            if cnt == k {
                ans +=  N - r + 1
            }
            if nums[l] == target {
                cnt -= 1
            }
            l += 1
        }
        return ans
    }
}
