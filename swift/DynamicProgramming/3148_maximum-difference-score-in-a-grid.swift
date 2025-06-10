//https://leetcode.com/problems/maximum-difference-score-in-a-grid/
class Solution {
    private typealias Pair = (start:Int, middle: Int)
    func maxScore(_ grid: [[Int]]) -> Int {
        let M = grid.count
        let N = grid[0].count

        var memo = grid

        var ans = Int.min
        if N > 1 {
            for j in 1..<N {
                ans = max(ans,grid[0][j] - memo[0][j - 1])
                memo[0][j] = min(memo[0][j - 1],memo[0][j])
            }
        }
        if M > 1 {
            for j in 1..<M {
                ans = max(ans,grid[j][0] - memo[j - 1][0])
                memo[j][0] = min(memo[j][0],memo[j - 1][0])
            }
        }

        

        if M > 1 && N > 1 {
            for i in 1..<M {
                for j in 1..<N {
                    ans = max(ans,grid[i][j] - min(memo[i - 1][j],memo[i][j - 1]))
                    memo[i][j] = min(memo[i][j],memo[i - 1][j], memo[i][j - 1])

                }
            }
        }


        return ans 
    }
}
