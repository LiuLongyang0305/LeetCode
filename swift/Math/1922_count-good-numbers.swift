// https://leetcode.com/problems/count-good-numbers/
class Solution {
    private let MOD = 1_000_000_007
    func countGoodNumbers(_ n: Int) -> Int {
        
        return quickPower(20, n >> 1) * (n % 2 == 0 ? 1 : 5) % MOD
    }
    private func quickPower(_ bottom: Int,_ exponent: Int) -> Int {
        guard exponent > 1 else {
            return exponent == 0 ? 1 : bottom
        }
        let half = quickPower(bottom, exponent >> 1) % MOD
        let ans = half % MOD * half % MOD
        if exponent % 2 == 0 {
            return ans
        } else {
            return bottom * ans % MOD
        }
    }
}

