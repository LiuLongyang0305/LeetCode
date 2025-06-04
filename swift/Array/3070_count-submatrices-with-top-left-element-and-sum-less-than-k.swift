// https://leetcode.com/problems/count-submatrices-with-top-left-element-and-sum-less-than-k
class Solution {
    func countSubmatrices(_ grid: [[Int]], _ k: Int) -> Int {

        var sum = grid
        let M = grid.count
        let N = grid[0].count
        if M > 1 {
            for i in 1..<M {
                sum[i][0] += sum[i - 1][0]

            }
        }
        if N > 1 {
            for j in 1..<N {
                sum[0][j] += sum[0][j - 1]
            }
        }
        if M > 1 && N > 1 {
            for i in 1..<M {
                for j in 1..<N {
                    sum[i][j] += sum[i - 1][j] + sum[i][j - 1] - sum[i - 1][j - 1]
                }
            }
        }
        // print(sum)
        var ans = 0
        for i in 0..<M {
            for j in 0..<N {
                if sum[i][j] <= k {
                    ans += 1
                }
            }
        }
        return ans
    }
}
