// https://leetcode.com/problems/palindrome-removal/
class Solution {
    func minimumMoves(_ arr: [Int]) -> Int {
        guard arr.count > 2 else {
            return arr.count <= 1 ? arr.count : (arr[0] == arr[1] ? 1 : 2)
        }
        let N = arr.count
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 200, count: N), count: N)
        for idx in 0..<N {
            dp[idx][idx] = 1
        }
        for j in  1..<N{
            for i in stride(from: j - 1, through: 0, by: -1) {
                if j - i == 1 {
                    dp[i][j] = arr[i] == arr[j] ? 1 : 2
                    continue
                }
                var ans = Int.max
                if arr[i] == arr[j] {
                    ans = dp[i + 1][j - 1]
                }
                for k in i..<j {
                   ans = min(ans, dp[i][k] + dp[k + 1][j])
                }
                dp[i][j] = ans
            }
        }
        return dp[0][N - 1]
    }
}
//TLE
class Solution1 {
    func minimumMoves(_ arr: [Int]) -> Int {
        var memo = [Int:Int]()
        func backtracking(_ from: Int, _ to: Int) -> Int {
            let key = from << 8 | to
            guard nil == memo[key] else {
                return memo[key]!
            }
            if from == to {
                memo[key] = 1
                return 1
            }
            if to - from == 1 {
                memo[key] = arr[to] == arr[from] ? 1 : 2
                return memo[key]!
            }
            var ans = Int.max
            if arr[to] == arr[from] {
                ans = backtracking(from + 1, to - 1)
            }
            var k = from
            while k < to {
                ans = min(ans, backtracking(from,k) + backtracking(k + 1, to))
                k += 1
            }
            memo[key] = ans
            return ans
        }
        return backtracking(0, arr.count - 1)
    }
}