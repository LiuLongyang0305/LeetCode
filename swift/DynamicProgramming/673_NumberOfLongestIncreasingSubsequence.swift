// https://leetcode.com/problems/number-of-longest-increasing-subsequence/
class Solution {
    typealias MaxLengthCounter = (length:Int,count:Int)
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        let N = nums.count
        guard N > 0 else {
            return M
        }
        var maxLength = 1
        var dp = Array<MaxLengthCounter>(repeating: (1,1), count: N)
        for i in 1..<N {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    let currentLength = dp[j].length + 1
                    if currentLength > dp[i].length {
                        dp[i] = (currentLength,dp[j].count)
                    } else if currentLength == dp[i].length {
                        dp[i].count += dp[j].count
                    }
                }
            }
            maxLength = max(dp[i].length, maxLength)
        }
        var ans = 0
        for (length,count) in dp where length == maxLength {
            ans += count
        }
        return ans
    }
 }

