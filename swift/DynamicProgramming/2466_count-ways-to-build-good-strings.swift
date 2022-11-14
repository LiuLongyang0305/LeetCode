// https://leetcode.com/problems/count-ways-to-build-good-strings/
class Solution {
    private  var memo = [Int:Int]()
    private  var zero = 0
    private  var one = 0
    private let MOD = 1_000_000_007
    func countGoodStrings(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {

        memo = [:]
        self.zero = zero
        self.one = one
        return (low...high).reduce(0) {$0 + dfs($1)} % MOD
    }



    func dfs(_ remainLength: Int) -> Int {
        guard remainLength >= 0 else {
            return 0
        }

        if remainLength == 0 {
            return 1
        }

        if let c = memo[remainLength]{return c}
        var ans = 0
        if remainLength >= zero {
            ans += dfs(remainLength - zero)
        }
        if remainLength >= one {
            ans += dfs(remainLength - one)
        }
        ans %= MOD
        memo[remainLength] = ans
        return ans

    }
}