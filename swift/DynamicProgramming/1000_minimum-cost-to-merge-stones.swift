// https://leetcode.com/problems/minimum-cost-to-merge-stones/
class Solution {
    private let INF = 0x3f3f3f3f
    func mergeStones(_ stones: [Int], _ k: Int) -> Int {
        let N = stones.count
        var prefix = [0] + stones
        (1...N).forEach {prefix[$0] += prefix[$0 - 1]}

        var memo = [[[Int?]]](repeating: [[Int?]](repeating: [Int?](repeating: nil, count: k + 5), count: N + 5), count: N + 5)
        func dfs(_ left: Int, _ right: Int, _ parts: Int) -> Int {
            guard (right - left + 1 - parts) % (k - 1) == -0 else {return INF}
            if left == right {
                return parts == 1 ? 0 : INF
            }
            guard nil == memo[left][right][parts] else {
                return memo[left][right][parts] ?? INF
            }
            if parts == 1 {
                return dfs(left, right,k) + prefix[right + 1] - prefix[left]
            }
            var ans = INF
            for pivot in left..<right{
                ans = min(ans, dfs(left, pivot, 1) + dfs(pivot + 1, right, parts - 1))
            }
            memo[left][right][parts] = ans
            return ans
        }
        let ans = dfs(0, N - 1, 1)
        return ans >= INF ? -1 : ans
    }
}
