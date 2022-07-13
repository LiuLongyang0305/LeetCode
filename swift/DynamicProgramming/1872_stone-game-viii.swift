// https://leetcode.com/problems/stone-game-viii/
class Solution {
    func stoneGameVIII(_ stones: [Int]) -> Int {
        let N = stones.count
        var preffix = [Int](repeating: 0, count: N + 1)
        for i in 0..<N {
            preffix[i + 1] = preffix[i] + stones[i]
        }

        var memo = [Int](repeating: Int.min, count: N)
        func dfs(_ idx: Int) -> Int {
            if idx == N - 1 {
                return preffix[idx + 1]
            }
            if Int.min == memo[idx] {
                memo[idx] = max(dfs(idx + 1), preffix[idx + 1] - dfs(idx + 1))
            }
            return memo[idx]

        }

        return dfs(1)
    }
}
