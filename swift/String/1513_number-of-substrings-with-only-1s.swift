// https://leetcode.com/problems/number-of-substrings-with-only-1s/
class Solution {
    private let MOD = 1_000_000_007
    func numSub(_ s: String) -> Int {
        var ans = 0
        var cntOnes = 0
        for ch in s {
            if ch == "0" {
                if cntOnes != 0 {
                    ans += (cntOnes * (1 + cntOnes)) >> 1
                    ans %= MOD
                }
                cntOnes = 0
            } else {
                cntOnes += 1
            }
        }
        if cntOnes != 0 {
            cntOnes %= MOD
            ans += (cntOnes * (1 + cntOnes)) >> 1
            ans %= MOD
        }
        return ans
    }
}