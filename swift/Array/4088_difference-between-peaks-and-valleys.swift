    // https://leetcode.cn/problems/difference-between-peaks-and-valleys/
    class Solution {
        func peakValleyDifference(_ nums: [Int]) -> Int {
            let M = nums.count
            var ans = 0
            for i in 1..<(M - 1) {
                if nums[i] > nums[i - 1] && nums[i] > nums[i + 1] {
                    ans += nums[i]
                }
                if nums[i] < nums[i - 1] && nums[i] < nums[i + 1] {
                    ans -= nums[i]
                }
            }
            return ans
        }
    }
