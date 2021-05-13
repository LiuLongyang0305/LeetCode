// https://leetcode.com/problems/number-of-ways-to-stay-in-the-same-place-after-some-steps/
class Solution {
    private let MOD = 1_000_000_007
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        let maxColumn = min(steps, arrLen - 1)
        var dp = Array<Int>(repeating: 0, count: maxColumn + 1)
        dp[0] = 1
        for _ in 1...steps {
            var dpNext = Array<Int>(repeating: 0, count: maxColumn + 1)
            for j in 0...maxColumn {
                var temp = dp[j]
                if j - 1 >= 0 {
                    temp = (temp + dp[j - 1]) % MOD
                }
                if j + 1 <= maxColumn {
                    temp = (temp + dp[j + 1]) % MOD
                }
                dpNext[j] = temp
            }
            dp = dpNext
        }
        
        return dp[0]
    }
}

