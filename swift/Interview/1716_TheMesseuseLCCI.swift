// https://leetcode-cn.com/problems/the-masseuse-lcci/
class Solution1 {
    private typealias TotalTime = (included:Int,excluded:Int)
    func massage(_ nums: [Int]) -> Int {
        
        guard nums.count > 2 else {
            return nums.isEmpty ? 0 : nums.max()!
        }
        let N = nums.count
        var dp = Array<TotalTime>(repeating: (0,0), count: N)
        dp[0].included = nums[0]
        for i in 1..<N {
            dp[i].included = dp[i - 1].excluded + nums[i]
            dp[i].excluded = max(dp[i - 1].included, dp[i - 1].excluded)
        }
        return max(dp[N - 1].included, dp[N - 1].excluded)
    }
}

class Solution {
    private typealias TotalTime = (included:Int,excluded:Int)
    func massage(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            return nums.isEmpty ? 0 : nums.max()!
        }
        var include = 0
        var excluded = 0
        for num in nums {
            (include,excluded) = (excluded + num, max(include, excluded))
        }
        return max(include, excluded)
    }
}