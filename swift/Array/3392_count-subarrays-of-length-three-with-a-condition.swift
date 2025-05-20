//https://leetcode.cn/problems/count-subarrays-of-length-three-with-a-condition/
class Solution {
    func countSubarrays(_ nums: [Int]) -> Int {
        var ans = 0
        let N = nums.count
        for i in 1..<(N - 1) {
            if 2 * ( nums[i - 1] + nums[i + 1]) == nums[i]  {
                ans += 1
            }
        }
        return ans
    }
}