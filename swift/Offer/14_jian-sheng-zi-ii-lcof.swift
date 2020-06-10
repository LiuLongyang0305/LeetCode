// https://leetcode-cn.com/problems/jian-sheng-zi-ii-lcof/
class Solution {
    private let MOD = 1_000_000_007
    func cuttingRope(_ n: Int) -> Int {
        return n <= 3 ? n - 1 : process(n)
    }
    private func process(_ n: Int) -> Int {
        return n > 4 ? 3 * process(n - 3) % MOD : n
    }
}
