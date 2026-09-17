   //https://leetcode.cn/problems/minimum-days-to-score-exactly-n-points/
    class Solution {
        private let preffixSum = (0...500).map { $0  * ($0 + 1) / 2}
        func minDays(_ n: Int) -> Int {
            var memo = [Int:Int]()
            func dfs(_ targetScore: Int) -> Int {
                guard targetScore > 0 else {return 0}
                if let v = memo[targetScore] {
                    return v
                }
                var sb = 2 * n
                var i = 1
                while preffixSum[i] <= targetScore {
                    sb = min(sb,i + 1 + dfs(targetScore - preffixSum[i]))
                    i += 1
                }
                memo[targetScore] = sb
                return sb
            }

            return dfs(n) - 1
        }
    }
