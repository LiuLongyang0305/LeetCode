// https://leetcode.com/problems/domino-and-tromino-tiling/
class Solution {
    private let MOD  = 1_000_000_007
    func numTilings(_ N: Int) -> Int {
        guard N < 4 else {
            return [1,2,5][N - 1]
        }
        var ans = (1,2,5)
        for _ in 4...N {
            ans = (ans.1,ans.2,(ans.2 << 1 + ans.0)  % MOD)
        }
        return ans.2
    }
 }

 class Solution {
    private let MOD = 1_000_000_007
    func numTilings(_ n: Int) -> Int {
        var memo = [[Int]](repeating: [Int](repeating: -1, count: 4), count: n + 5)
        func dfs(_ width : Int,_ state: Int) -> Int {
            if width == 1 {return state == 0 ? 1 : 0}
            if width == 2 {return state == 0 ? 2 : 1}
            guard -1 == memo[width][state] else {
                return memo[width][state]
            }
            var ans = 0
            if state == 0 {
                ans = (dfs(width - 1, 0) + dfs(width - 2, 0) + dfs(width - 1, 1) + dfs(width - 1, 2)) % MOD
            } else if state == 1 {
                ans = (dfs(width - 1, 2) + dfs(width - 2, 0)) % MOD
            } else {
                ans = (dfs(width - 1, 1) + dfs(width - 2, 0)) % MOD
            }
            memo[width][state] = ans
            return ans
        }

        return dfs(n,0)
    }
}