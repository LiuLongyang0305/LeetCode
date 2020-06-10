// https://leetcode-cn.com/problems/jian-sheng-zi-lcof/
class Solution {
    func cuttingRope(_ n: Int) -> Int {
        var dp = Array<Int>(repeating: 0, count: n + 1)
        for i in 2...n {
            
            for j in 1...i / 2 {
                let temp1 = j <= 3 ? j : dp[j]
                let temp2 = i - j <= 3 ? (i - j) : dp[i - j]
                dp[i] = max(dp[i], temp1 * temp2)
            }
        }
        return dp.last!
    }
}