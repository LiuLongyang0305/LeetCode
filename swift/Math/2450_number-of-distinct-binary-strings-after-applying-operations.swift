// https://leetcode.com/problems/number-of-distinct-binary-strings-after-applying-operations/
class Solution {
    private let MOD = 1_000_000_007
    func countDistinctStrings(_ s: String, _ k: Int) -> Int {
        let N = s.count
        var ans = 1
        for i in 0..<N {
            guard k + i - 1 < N else {break}
            ans *= 2
            ans %= MOD
        }
        return ans
    }
}