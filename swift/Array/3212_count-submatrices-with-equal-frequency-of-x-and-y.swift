// https://leetcode.com/problems/count-submatrices-with-equal-frequency-of-x-and-y/

class Solution {
    func numberOfSubmatrices(_ grid: [[Character]]) -> Int {
        let M = grid.count
        let N = grid[0].count
        let chars = grid.map {[Character]($0)}
        var sum = [[(Int,Int)]](repeating: [(Int, Int)](repeating: (0,0), count: N), count: M)
        for i in 0..<M {
            for j in 0..<N {
                sum[i][j] = chars[i][j] == "X" ? (1,0) : (chars[i][j] == "Y" ? (0,1) : (0,0))
            }
        }
        if N > 1 {
            for i in 1..<N {
                sum[0][i].1 += sum[0][i - 1].1
                sum[0][i].0 += sum[0][i - 1].0
            }
        }
        if M > 1 {
            for j in 1..<M {
                sum[j][0].1 += sum[j - 1][0].1
                sum[j][0].0 += sum[j - 1][0].0
            }
        }

        if M > 1 && N > 1 {
            for i in 1..<M {
                for j in 1..<N {
                    sum[i][j].1 += sum[i - 1][j].1 + sum[i][j - 1].1 - sum[i - 1][j - 1].1
                    sum[i][j].0 += sum[i - 1][j].0 + sum[i][j - 1].0 - sum[i - 1][j - 1].0
                }
            }
        }
        var ans = 0
        for i in 0..<M {
            for j in 0..<N {
                if sum[i][j].0 == sum[i][j].1 && sum[i][j].0 != 0 {
                    ans += 1
                }
            }
        }
        return ans
    }
}

