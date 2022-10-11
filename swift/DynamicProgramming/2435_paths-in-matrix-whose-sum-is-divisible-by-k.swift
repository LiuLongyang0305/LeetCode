// https://leetcode.com/problems/paths-in-matrix-whose-sum-is-divisible-by-k/
class Solution {
    private let MOD = 1_000_000_007
    func numberOfPaths(_ grid: [[Int]], _ k: Int) -> Int {
        let M = grid.count
        let N = grid[0].count
        var dp = [[[Int:Int]]](repeating: [[Int : Int]](repeating: [:], count: N), count: M)
        var sum = 0
        for c in 0..<N {
            sum += grid[0][c]
            dp[0][c][sum % k] = 1
        }
        sum = grid[0][0]
        for r in stride(from: 1, to: M, by: 1) {
                sum += grid[r][0]
                dp[r][0][sum % k ] = 1
        }

        for r in stride(from: 1, to: M, by: 1) {
            for c in stride(from: 1, to: N, by: 1) {
                let t = grid[r][c]
                var counter = [Int:Int]()
                for (p,cnt) in dp[r - 1][c] {
                    let cur = (p + t) % k
                    counter[cur] = ((counter[cur] ?? 0) + cnt) % MOD
                }
                for (p,cnt) in dp[r][c - 1] {
                    let cur = (p + t) % k
                    counter[cur] = ((counter[cur] ?? 0) + cnt) % MOD
                }
                dp[r][c] = counter
            }
        }
        return dp[M - 1][N - 1][0] ?? 0
    }
}