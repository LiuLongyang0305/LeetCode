//https://leetcode.com/problems/profitable-schemes/
class Solution {
    private let MOD = 1_000_000_007
    func profitableSchemes(_ G: Int, _ P: Int, _ group: [Int], _ profit: [Int]) -> Int {
        var  dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: G + 1), count: P + 1)
        dp[0][0] = 1
        for k in 0..<group.count {
            let g = group[k]
            let p = profit[k]
            for i in stride(from: P, through: 0, by: -1) {
                for j in stride(from: G - g, through: 0, by: -1) {
                    dp[min(i + p, P)][j + g] = (dp[min(i + p, P)][j + g] + dp[i][j]) % MOD
                }
            }
        }
        return  dp[P].reduce(0) { ($0 + $1) % MOD}
    }
    
}