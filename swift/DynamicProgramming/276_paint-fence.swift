// https://leetcode.com/problems/paint-fence/
class Solution {
    func numWays(_ n: Int, _ k: Int) -> Int {
        guard n >= 2 else {
            return n == 0 ? 0 : k
        }
        var dp = Array<Int>(repeating: 0, count: n + 1)
        for index in 1...n {
            if index == 1 {
                dp[index] = k
            } else if index == 2 {
                dp[index] = k * k
            } else {
                dp[index] = dp[index - 1] * (k - 1) + dp[index - 2] * (k - 1)
            }
        }
        return dp[n]
    }
}
