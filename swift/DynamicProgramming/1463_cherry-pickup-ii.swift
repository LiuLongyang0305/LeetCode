// https://leetcode.com/problems/cherry-pickup-ii/
class Solution {
    private var grid = [[Int]]()
    private var memo = [Int:Int]()
    private var M = -1
    private var N = -1
    func cherryPickup(_ grid: [[Int]]) -> Int {
        self.grid = grid
        self.memo = [:]
        self.M = grid.count
        self.N = grid[0].count
        return helper(0, 0, grid[0].count - 1)
    }
    private func helper(_ i: Int, _ first: Int, _ second: Int) -> Int {
        let curLevelNum = first == second ? grid[i][first] : grid[i][first] + grid[i][second]
        if i == grid.count - 1 {
            return curLevelNum
        }
        let key = i | (first << 16) | (second << 32)
        guard nil == memo[key] else {
            return memo[key]!
        }
        var ans = 0
        for f in [first - 1,first,first + 1] {
            guard f >= 0 && f < N else {
                continue
            }
            for s in [second - 1,second, second + 1] {
                guard s >= 0 && s < N else {
                    continue
                }
                ans = max(ans, helper(i + 1, f, s))
            }
        }
        ans +=  curLevelNum
        memo[key] = ans
        return ans
    }
}

