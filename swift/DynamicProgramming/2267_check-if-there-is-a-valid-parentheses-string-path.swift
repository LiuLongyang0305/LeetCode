//https://leetcode.com/problems/check-if-there-is-a-valid-parentheses-string-path/
class Solution {
    func hasValidPath(_ grid: [[Character]]) -> Bool {
        let M = grid.count
        let N = grid[0].count

        var dp = [[Set<Int>]](repeating: [Set<Int>](repeating: [], count: N), count: M)
        dp[0][0] = grid[0][0] == "(" ? [1] : []
        
        for c in 1..<N {

            dp[0][c] = grid[0][c] == "(" ? caculateOnLeft(last: dp[0][c - 1]) : caculateOnRight(last: dp[0][c - 1])
        }
        for r in 1..<M {
            dp[r][0] = grid[r][0] == "(" ? caculateOnLeft(last: dp[r - 1][0]) : caculateOnRight(last: dp[r - 1][0])
        }

        for r in 1..<M {
            for c in 1..<N {
                let total = dp[r - 1][c].union(dp[r][c - 1])
                dp[r][c] = grid[r][c] == "(" ? caculateOnLeft(last: total) : caculateOnRight(last: total)
            }
        }

        return dp[M - 1][N - 1].contains(0)
    }


    private func caculateOnLeft( last: Set<Int>) -> Set<Int> {
        var ans = Set<Int>()
        for l in last {
            ans.insert(l + 1)
        }
        return ans
    }
    private func caculateOnRight(last: Set<Int>) -> Set<Int> {
        var ans = Set<Int>()
        for  l in last {
            if l > 0 {
                ans.insert(l - 1)
            }
        }
        return ans
    }
}
