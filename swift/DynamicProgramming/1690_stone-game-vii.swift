// https://leetcode.com/problems/stone-game-vii/
class Solution {
    func stoneGameVII(_ stones: [Int]) -> Int {

        let N = stones.count
        var preffix = [Int](repeating: 0, count: N + 1)
        for i in 0..<N {
            preffix[i + 1] = preffix[i] + stones[i]
        }


        var memo = [[Int]](repeating: [Int](repeating: -1, count: N), count: N)
        func dfs(_ left: Int, _ right: Int) -> Int {
            guard left < right else {return 0}
            guard -1 == memo[left][right] else {return memo[left][right]}
            let ans = max(preffix[right + 1] - preffix[left + 1] - dfs(left + 1, right),preffix[right] - preffix[left] - dfs(left, right - 1))
            memo[left][right] = ans
            return ans
        }
        return dfs(0, N - 1)
    }
}