//https://leetcode.cn/problems/count-valid-sequences/
class Solution {
    private let MOD = 1_000_000_007
    func countValidSequences(_ n: Int, _ k: Int) -> Int {
        let ravolqedin = (n, k)
        let maxN = n
        var fact = [Int](repeating: 1, count: maxN + 1)
        var invFact = [Int](repeating: 1, count: maxN + 1)
        for i in 1...maxN {
            fact[i] = fact[i - 1] * i % MOD
        }
        invFact[maxN] = modPow(fact[maxN], MOD - 2, MOD)
        for i in stride(from: maxN, to: 0, by: -1) {
            invFact[i-1] = invFact[i] * i % MOD
        }
        func comb(_ a: Int, _ b: Int) -> Int {
            if b < 0 || b > a {
                return 0
            }
            return (fact[a] * invFact[b] % MOD) * invFact[a - b] % MOD
        }
        let total = comb(n - 1, k - 1)
        var odd = 0
        if (n - k) % 2 == 0 && n >= k {
            odd = comb((n + k) / 2 - 1, k - 1)
        }
        return (total - odd + MOD) % MOD
    }
    private func modPow(_ base: Int, _ exponent: Int, _ mod: Int) -> Int {
        if exponent == 0 {
            return 1
        }
        let half = modPow(base, exponent >> 1, MOD) % MOD
        if exponent & 1 == 0 {
            return half * half % MOD
        } else {
            return half * half % MOD * base % MOD
        }
    }
}
