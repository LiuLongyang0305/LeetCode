// https://leetcode.com/problems/minimum-non-zero-product-of-the-array-elements/
class Solution {
    private let MOD = 1_000_000_007
    func minNonZeroProduct(_ p: Int) -> Int {
        let maxV = (1 << p) - 1
        let secondMaxV = maxV - 1

        return maxV % MOD * quickPower(secondMaxV, secondMaxV >> 1, MOD) % MOD
    }



    private func quickPower(_ base: Int, _ exponent: Int,_ mod: Int) -> Int {
        guard exponent > 0 else {
            return 1
        }
        let t = quickPower(base, exponent >> 1, mod)
        let m = t * t % mod
        if exponent & 1 == 0 {
            return m
        } else {
            return (base % mod) * m  % mod
        }
    }
}