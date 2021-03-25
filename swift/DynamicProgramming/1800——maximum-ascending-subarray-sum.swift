// https://leetcode.com/problems/maximum-ascending-subarray-sum/
class Solution {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums[0]
        }
        let N = nums.count
        var dp = nums
        for i in 1..<N {
            if nums[i] > nums[i - 1] {
                dp[i] = dp[i - 1] + nums[i]
            }
        }
        return dp.max() ?? -1
    }
}


class Solution1 {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        let N = nums.count
        var ans = 0
        for i in 0..<N {
            var t = nums[i]
            var j = i + 1
            while j < N && nums[j] > nums[j - 1] {
                t += nums[j]
                j += 1
            }
            ans = max(t,ans)
        }
        return ans
    }
}
