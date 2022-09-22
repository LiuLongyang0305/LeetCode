// https://leetcode.com/problems/length-of-the-longest-alphabetical-continuous-substring/
class Solution {
    func longestContinuousSubstring(_ s: String) -> Int {
        let nums = s.map { Int($0.asciiValue ?? 0)}
        let N = nums.count
        var ans = 1

        for left in 0..<N {
            var right = left
            while right < N && nums[right] - nums[left] == right - left {
                right += 1
            }
            ans = max(ans, right - left )
        }
        return ans
    }
}