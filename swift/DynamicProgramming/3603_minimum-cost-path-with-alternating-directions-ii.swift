    //https://leetcode.cn/problems/minimum-cost-path-with-alternating-directions-ii/
class Solution {
    func minCost(_ m: Int, _ n: Int, _ waitCost: [[Int]]) -> Int {
        var memo = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        memo[0][0] = 1
        if m > 1 {
            memo[1][0] = memo[0][0] + 2
            if m > 2 {
                for r in 2..<m {
                    memo[r][0] = memo[r - 1][0] + (r + 1) + waitCost[r - 1][0]
                }
            }

        }
        if n > 1 {
            memo[0][1] = memo[0][0] + 2
            if n > 2 {
                for c in 2..<n {
                    memo[0][c] = memo[0][c - 1] + (c + 1) + waitCost[0][c - 1]
                }
            }

        }
        if m > 1 && n > 1 {
            for r in 1..<m {
                for c in 1..<n {
                    memo[r][c] = min(memo[r - 1][c] + waitCost[r - 1][c], memo[r][c - 1] + waitCost[r][c - 1]) + (r + 1) * (c + 1)
                }
            }
        }
        return memo[m - 1][n - 1]
    }
}
