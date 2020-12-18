// https://leetcode.com/problems/sum-of-subsequence-widths/
class Solution {
    private let MOD = 1_000_000_007
    func sumSubseqWidths(_ A: [Int]) -> Int {
        var ans = 0
        let N = A.count
        let sortedA = A.sorted()
        var powTwo = [1]
        for _ in 1..<N {
            powTwo.append(powTwo.last! * 2 % MOD)
        }
        for i in 0..<N {
            ans = (ans + (powTwo[i] - powTwo[N - 1 - i]) * sortedA[i]) % MOD
        }
        return ans
    }
}
