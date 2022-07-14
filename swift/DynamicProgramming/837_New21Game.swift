// https://leetcode.com/problems/new-21-game/
class Solution {
    func new21Game(_ N: Int, _ K: Int, _ W: Int) -> Double {
        guard K != 0 && N < (K + W) else {
            return 1.0
        }
        var dp = Array<Double>(repeating: 0, count: N + 1)
        dp[0] = 1.0
        var Wsum = 1.0
        var res = 0.0
        for i in 1...N {
            dp[i] = Wsum / Double(W)
            if i < K {
                Wsum += dp[i]
            } else {
                res += dp[i]
            }
            if i - W >= 0 {
                Wsum -= dp[i - W]
            }
        }
        return res
    }
}

class Solution {
    func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
        guard k > 0 else {
            return 1.0
        }
        let unit = 1.0 / Double(maxPts)
        var memo = [Int:Double]()
        func dfs(_ start:Int) -> Double {
            guard start != k - 1 else {
                return Double(min(n - k + 1, maxPts)) * unit
            }
            guard start < k else {return start <= n ? 1 : 0}
            if let v = memo[start] {
                return v
            }
            let next = dfs(start + 1)
            let ans = next + unit * (next - dfs(start + maxPts + 1))
            memo[start] = ans
            return ans

        }
        return dfs(0)
    }
}