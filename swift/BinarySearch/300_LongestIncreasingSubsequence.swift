//https://leetcode.com/problems/longest-increasing-subsequence/
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard nums.count != 0 else {
            return 0
        }
        var dp = Array<Int>(repeating: 1, count: nums.count)
        var maxAns = 1
        for i in 0..<nums.count {
            var maxVal = 0
            for j in 0..<i {
                if nums[i] > nums[j] {
                    maxVal = max(maxVal,dp[j])
                }
            }
            dp[i] = maxVal + 1
            maxAns = max(maxAns,dp[i])
        }
        return maxAns
    }
}
class Solution2 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var tails = Array<Int>(repeating: 0, count: nums.count)
        var res = 0
        for num in nums {
           var i  = 0
            var j = res
            while i < j {
                let m = (i + j)  / 2
                if tails[m] < num {
                    i = m + 1
                } else {
                    j = m
                }
            }
            tails[i] = num
            if j == res {
                res += 1
            }
        }
        return res
    }
}