    // https://leetcode.cn/problems/minimum-cost-to-split-into-ones/
    class Solution {
        static var memo = [Int](repeating: Int.max, count: 505)
        init() {
            Solution.memo[1] = 0
            dfs(500)
        }
        func minCost(_ n: Int) -> Int {
            return Solution.memo[n]
        }

        @discardableResult
        private func dfs(_ num: Int) -> Int {
            if num == 1 {return 0}
            if Int.max != Solution.memo[num] {return Solution.memo[num] }
            var sb = Int.max
            for i in 1..<num {
                sb = min(sb,dfs(i) + dfs(num - i) + i * (num - i))
            }
            Solution.memo[num] = sb
            return sb
        }
    }
