// https://leetcode.com/problems/count-subarrays-with-score-less-than-k/
class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        let M = nums.count
        var preffix = [Int](repeating: 0, count: M + 1)
        for i in 1...M {
            preffix[i] = preffix[i - 1] + nums[i - 1]
        }
        var ans = 0
        var left = 0
        var right = 0
        while left < M {
            while right < M && (preffix[right + 1] - preffix[left]) * (right - left + 1) < k {
                right += 1
            }
            ans += right - left
            left += 1
        }
        return ans
    }
}