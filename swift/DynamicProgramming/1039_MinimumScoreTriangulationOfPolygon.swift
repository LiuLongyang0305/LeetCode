//https://leetcode.com/problems/minimum-score-triangulation-of-polygon/
class Solution1 {
    func minScoreTriangulation(_ A: [Int]) -> Int {
        let N = A.count
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: Int.max, count: N), count: N)
        dp[N - 1][0] = 0
        for i in 0..<(N - 1) {
            dp[i][i + 1] = 0
        }
        for i in (0..<(N - 1)).reversed() {
            for j in (i  + 1)..<N {
                var k = i + 1
                while k < j {
                    dp[i][j] = min(dp[i][j], dp[i][k] + dp[k][j] + A[i] * A[k]  * A[j])
                    k += 1
                }
            }
        }
        return dp[0][N - 1]
    }
    
 }
 class Solution {
    private var memo = [[Int]]()
    private var N = -1
    private var A = [Int]()
    func minScoreTriangulation(_ A: [Int]) -> Int {
        self.A = A
        N = A.count
        memo =  Array<Array<Int>>(repeating: Array<Int>(repeating: Int.max, count: N), count: N)
        memo[N - 1][0] = 0
        for i in 0..<(N - 1) {
            memo[i][i + 1] = 0
        }
        return minScore(i: 0, j: N - 1)
    }
    private func minScore(i: Int, j: Int) -> Int {
        let jCopy: Int = j == 0 ? N - 1 : j
        guard memo[i][jCopy] == Int.max else{
            return memo[i][jCopy]
        }
        var ans = Int.max
        var k = i + 1
        while k < jCopy {
            ans = min(ans, minScore(i: i, j: k) + minScore(i: k, j: j) + A[i] * A[j] * A[k])
            k += 1
        }
        memo[i][j] = ans
        return ans
    }
 }

