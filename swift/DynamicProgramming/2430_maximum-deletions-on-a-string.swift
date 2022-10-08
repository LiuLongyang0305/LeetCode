 // https://leetcode.com/problems/maximum-deletions-on-a-string/
class Solution {
    func deleteString(_ s: String) -> Int {

        let N = s.count
        let chars = [Character](s)

        var lcp = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: N + 1)
        for i in stride(from: N - 1, through: 0, by: -1) {
            for j in stride(from: N - 1, through: 0, by: -1) {
                if chars[i] == chars[j] {
                    lcp[i][j] = lcp[i + 1][j + 1] + 1
                }
            }
        }

        var memo = [Int](repeating: -1, count: N + 5)
        func dfs(_ idx: Int) -> Int {
            guard -1 == memo[idx] else {
                return memo[idx]
            }
            var ans = 1
            var leftEndIdx = idx
            var rightStartIdx = idx + 1
            while leftEndIdx - idx <= N - 1 - rightStartIdx {
                if lcp[idx][rightStartIdx] >= rightStartIdx - idx {
                    ans = max(ans, 1 + dfs(rightStartIdx))
                }
                leftEndIdx += 1
                rightStartIdx += 1
            }
            memo[idx] = ans
            return ans
        }


        return dfs(0)
    }
}