// https://leetcode.com/problems/stone-game-iii/
class Solution {
    func stoneGameIII(_ stoneValue: [Int]) -> String {

        let N = stoneValue.count
        var preffix = [Int](repeating: 0, count: N + 1)
        for i in 0..<N {
            preffix[i + 1] = preffix[i] + stoneValue[i]
        }
        var memo = [Int](repeating: Int.min, count: N)
        func dfs(_ idx: Int) -> Int {
            guard idx < N else {return 0}
            guard Int.min == memo[idx] else {
                return memo[idx]
            }
            var ans = Int.min
            for length in 1...3 {
                ans = max(ans, preffix[N] - preffix[idx] - dfs(idx + length))
            }
            memo[idx] = ans
            return ans
        }
        let aliceScore = dfs(0)
        let bobScore = preffix[N] - dfs(0)

        return aliceScore > bobScore ? "Alice" : (aliceScore == bobScore ? "Tie" : "Bob")
    }
}