// https://leetcode.com/problems/count-number-of-ways-to-place-houses/
class Solution {
    private let MOD = 1_000_000_007
    func countHousePlacements(_ n: Int) -> Int {


        let ways = solve(n)
        return ways * ways % MOD
    }


    private func solve(_ n: Int) -> Int {
        var memo = [[Int]](repeating: [Int](repeating: -1, count: n), count: 2)

        func dfs(_ curPos: Int, _ lastHouse: Int) -> Int {

            guard curPos < n else {
                return 1
            }

            let flag = curPos - lastHouse > 1 ? 1 : 0
            guard memo[flag][curPos] == -1 else {return memo[flag][curPos]}
            var ans = dfs(curPos + 1, lastHouse)
            if 1 == flag  {
                ans += dfs(curPos + 1, curPos)
                ans %= MOD
            }
            memo[flag][curPos] = ans
            return ans
        }
        return dfs(0, -2)
    }
}