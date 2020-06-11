// https://leetcode.com/problems/minimum-falling-path-sum-ii/
class Solution {
    func minFallingPathSum(_ arr: [[Int]]) -> Int {
        let M = arr.count
        let N = arr[0].count
        guard M > 1 else {
            return arr[0].min()
        }
        guard N > 1 else {
            return 0
        }
        for r in 1..<M {
            for curC in 0..<N {
                dp[r][curC] = 200000
                for lastC in 0..<N {
                    if lastC != curC {
                        dp[r][curC] = min(dp[r][curC], dp[r - 1][lastC] + arr[r][curC])
                    }
                }
            }
        }
        // print(dp)
        return dp[M - 1].min()!
    }
    
    
}