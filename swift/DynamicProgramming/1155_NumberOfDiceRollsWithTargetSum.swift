// https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/
 class Solution {
    private static let MOD = 1_000_000_007
     func numRollsToTarget(_ d: Int, _ f: Int, _ target: Int) -> Int {
        guard d > 1 else {
            return target <= f ? 1 : 0
        }
        guard target >= d && target <= d * f else {
            return 0
        }
        guard target != d && target != d * f else {
            return 1
        }
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: d * f + 1), count: d + 1)
        for i in 1...min(f,target) {
            dp[1][i] = 1
        }
        for i in 2...d {
            for j in i...(i * f) {
                var k = 1
                while j - k >= 0 && k <= f {
                    dp[i][j] = (dp[i][j] + dp[i - 1][j - k]) % Solution.MOD
                    k += 1
                }
            }
        }
         return dp[d][target]
     }
 }
