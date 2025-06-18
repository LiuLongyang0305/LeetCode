//https://leetcode.com/problems/minimum-number-of-operations-to-satisfy-condition
class Solution {
    func minimumOperations(_ grid: [[Int]]) -> Int {
        let M = grid.count
        let N = grid[0].count
        var cnt = [[Int]](repeating: [Int](repeating: 0, count: 10), count: N)
        for i in 0..<M {
            for j in 0..<N {
                cnt[j][grid[i][j]] += 1
            }
        }
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: 10), count: N)


        func dfs(_ cur: Int, _ last: Int) -> Int {
            guard cur < N else {return 0}
            if last != -1 {
                if let v = memo[cur][last] {
                    return v
                }
            }

            var ans = Int.max / 2

            for next in 0..<10 {
                if next != last {
                    ans = min(ans, M - cnt[cur][next] + dfs(cur + 1, next))
                }
            }


            if last != -1 {
                memo[cur][last] = ans
            }
            return ans
        }


        return dfs(0,-1)
    }
}
