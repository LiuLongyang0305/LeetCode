// https://leetcode-cn.com/problems/get-kth-magic-number-lcci/
class Solution {
    func getKthMagicNumber(_ k: Int) -> Int {
        guard k != 1 else {
            return 1
        }
        var p3 = 0
        var p5 = 0
        var p7 = 0
        var dp = Array<Int>(repeating: 1, count: k)
        for i in 1..<k {
            let a = dp[p3] * 3
            let b = dp[p5] * 5
            let c = dp[p7] * 7
            dp[i] = min(a,b,c)
            if dp[i] == a {
                p3 += 1
            }
            if dp[i] == b {
                p5 += 1
            }
            if dp[i] == c {
                p7 += 1
            }
        }
        return dp[k - 1]
    }
}
