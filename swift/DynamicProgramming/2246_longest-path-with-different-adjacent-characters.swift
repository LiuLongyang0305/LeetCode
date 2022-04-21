// https://leetcode.com/problems/longest-path-with-different-adjacent-characters/
class Solution {
    func longestPath(_ parent: [Int], _ s: String) -> Int {
        let chars = [Character](s)
        let N = parent.count
        var tree = [[Int]](repeating: [], count: N)

        for i in 1..<N {
            tree[parent[i]].append(i)
        }

        var ans = 0

        @discardableResult
        func dfs(_ node: Int) -> Int {
            var maxLen = 0
            for child in tree[node] {
                let len = dfs(child) + 1
                if chars[node] != chars[child] {
                    ans = max(ans, maxLen + len)
                    maxLen = max(maxLen, len)
                }
            }
            return maxLen
        }

        dfs(0)
        return ans + 1
    }
}