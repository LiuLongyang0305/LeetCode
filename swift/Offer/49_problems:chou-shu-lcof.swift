// https://leetcode-cn.com/problems/chou-shu-lcof/
class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }
        var dp = Array<Int>(repeating: 0, count: n)
        dp[0] = 1
        var p2 = 0
        var p3 = 0
        var p5 = 0
        for i in 1..<n {
            dp[i] = min(2 * dp[p2], 3 * dp[p3], 5 * dp[p5])
            if dp[i] >= 2 * dp[p2] {
                p2 += 1
            }
            if dp[i] >= 3 * dp[p3] {
                p3 += 1
            }
            if dp[i] >= 5 * dp[p5] {
                p5 += 1
            }
        }
        return dp[n - 1]
    }
}