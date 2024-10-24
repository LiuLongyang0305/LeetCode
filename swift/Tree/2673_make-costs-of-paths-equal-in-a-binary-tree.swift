//https://leetcode.cn/problems/make-costs-of-paths-equal-in-a-binary-tree/
class Solution {
    //编号1~N
    func minIncrements(_ n: Int, _ cost: [Int]) -> Int {
        var ans = 0
        @discardableResult
        func dfs(_ parent: Int) -> Int {
            guard parent <= n else {
                return 0
            }
            let lc = dfs(2 * parent)
            let rc = dfs(2 * parent + 1)
            ans += abs(lc - rc)
            return max(lc, rc) + cost[parent - 1]
        }
        dfs(1)
        return ans
    }
}