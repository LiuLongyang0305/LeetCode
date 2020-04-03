// https://leetcode.com/problems/new-21-game/
class Solution {
    func new21Game(_ N: Int, _ K: Int, _ W: Int) -> Double {
        guard K != 0 && N < (K + W) else {
            return 1.0
        }
        var dp = Array<Double>(repeating: 0, count: N + 1)
        dp[0] = 1.0
        var Wsum = 1.0
        var res = 0.0
        for i in 1...N {
            dp[i] = Wsum / Double(W)
            if i < K {
                Wsum += dp[i]
            } else {
                res += dp[i]
            }
            if i - W >= 0 {
                Wsum -= dp[i - W]
            }
        }
        return res
    }
}