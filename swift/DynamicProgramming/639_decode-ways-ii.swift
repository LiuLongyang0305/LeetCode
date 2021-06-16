// https://leetcode.com/problems/decode-ways-ii/
class Solution {
    private let MOD = 1_000_000_007
    func numDecodings(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        guard s.count > 1 else {
            return s.first! == "*" ? 9 : (s.first! == "0" ? 0 : 1)
        }
        var dp = Array<Int>(repeating: 0, count: s.count + 1)
        let chars = [Character](s)
        dp[0] = 1
        dp[1] = chars[0] == "*" ? 9 : (chars[0] == "0" ? 0 : 1 )
        for idx in 1..<s.count {
            var cur = 0
            if chars[idx] == "*" {
                cur = 9 * dp[idx]
                if chars[idx - 1] == "1" {
                    cur = (cur + 9 * dp[idx - 1]) % MOD
                } else if chars[idx - 1] == "2" {
                    cur = (cur + 6 * dp[idx - 1]) % MOD
                } else if chars[idx - 1] == "*" {
                    cur = (cur + 15 * dp[idx - 1]) % MOD
                }
            } else {
                cur = chars[idx] == "0" ? 0 : dp[idx]
                if chars[idx - 1] == "1" {
                    cur = (cur + dp[idx - 1]) % MOD
                } else if chars[idx - 1] == "2" && chars[idx] <= "6" {
                    cur = (cur + dp[idx - 1]) % MOD
                } else if chars[idx - 1] == "*" {
                    cur = (cur + (chars[idx] <= "6" ? 2 : 1 ) * dp[idx - 1]) % MOD
                }
            }
            cur %= MOD
            dp[idx + 1] = cur
        }
        return dp[s.count]
    }
}