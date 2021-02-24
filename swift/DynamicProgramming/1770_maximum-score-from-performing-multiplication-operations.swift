 // https://leetcode.com/problems/maximum-score-from-performing-multiplication-operations/
class Solution {
    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        let M = nums.count
        let N = multipliers.count
        var memo = Array<Array<Int?>>(repeating: Array<Int?>(repeating: nil, count: N + 1 ), count: N + 1)
        func dfs(_ l: Int, _ r: Int, _ i: Int) -> Int {
            guard i < N else {
                return 0
            }
            if let score = memo[i][l] {
                return score
            }
            memo[i][l] = max(nums[l] * multipliers[i] + dfs(l + 1, r, i + 1), nums[r] * multipliers[i] + dfs(l, r - 1, i + 1))
            return memo[i][l] ?? 0
        }
        return dfs(0, M - 1, 0)
    }
}