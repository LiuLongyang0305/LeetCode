// https://leetcode.cn/problems/count-paths-with-the-given-xor-value/
class Solution {
    private let MOD = 1_000_000_007
    func countPathsWithXorValue(_ grid: [[Int]], _ k: Int) -> Int {

        let M = grid.count
        let N = grid[0].count


        var memo = [[[Int:Int]]](repeating: [[Int:Int]](repeating: [:], count: N), count: M)
        memo[0][0][grid[0][0]] = 1

        if N > 1 {
            for j in 1..<N {
                for (v,cnt) in memo[0][j - 1] {
                    memo[0][j][v ^ grid[0][j]] = cnt
                }
            }
        }
        if M > 1 {
            for i in 1..<M {
                for (v,cnt) in memo[i - 1][0] {
                    memo[i][0][v ^ grid[i][0]] = cnt
                }
            }
        }

        if M > 1 && N > 1 {
            for i in 1..<M {
                for j in 1..<N {

                    for (v,cnt) in memo[i - 1][j] {
                        memo[i][j][v ^ grid[i][j], default: 0] += cnt
                        memo[i][j][v ^ grid[i][j], default: 0]  %= MOD
                    }

                    for (v,cnt) in memo[i][j - 1] {
                        memo[i][j][v ^ grid[i][j], default: 0] += cnt
                        memo[i][j][v ^ grid[i][j], default: 0]  %= MOD
                    }
                }
            }
        }
        return memo[M - 1][N - 1][k] ?? 0
    }
}
