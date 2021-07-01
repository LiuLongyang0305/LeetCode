// https://leetcode.com/problems/remove-one-element-to-make-the-array-strictly-increasing/
//最长上升子序列
class Solution {
    func canBeIncreasing(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else {
            return true
        }
        let N = nums.count
        var dp = Array<Int>(repeating: 1, count: N)
        for i in 0..<N {
            var temp = 1
            var j = i - 1
            while j >= 0 {
                if nums[j] < nums[i] {
                    temp = max(temp, dp[j] + 1)
                }
                j -= 1
            }
            dp[i] = temp
        }
        return dp.max()! >= N - 1
    }
}

