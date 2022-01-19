// https://leetcode.com/problems/solving-questions-with-brainpower/
class Solution {
    private typealias Score = (include: Int, exclude: Int)
    func mostPoints1(_ questions: [[Int]]) -> Int {
        let N = questions.count
        var dp = [Int](repeating: 0, count: N + 1)
        for idx in stride(from: N - 1, through: 0, by: -1) {
            let nextIdx = questions[idx][1] + idx + 1
            dp[idx] = max(questions[idx][0] + (nextIdx < N ? dp[nextIdx] : 0),dp[idx + 1] )
        }
        return dp[0]
    }
    
    func mostPoints2(_ questions: [[Int]]) -> Int {
        let N = questions.count
        var dp = [Int](repeating: 0, count: N + 1)
        for i in 0..<N {
            dp[i + 1] = max(dp[i + 1], dp[i])
            let j = min(questions[i][1] + i + 1,N)
            dp[j] = max(dp[j], dp[i] + questions[i][0])
        }
        return dp[N]
    }
    
    
    func mostPoints(_ questions: [[Int]]) -> Int {
        let N = questions.count
        
        var memo = [Int](repeating: -1, count: N)
        
        func  dfs(_ idx: Int) -> Int {
            guard idx < N - 1 else {
                return idx == N - 1 ? questions[N - 1][0] : 0
            }
            guard -1 == memo[idx] else {return memo[idx]}
            memo[idx] = max(questions[idx][0] + dfs(idx + questions[idx][1] + 1), dfs(idx + 1))
            return memo[idx]
        }
        return dfs(0)
    }
}