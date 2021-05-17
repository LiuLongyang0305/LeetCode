// https://leetcode.com/problems/number-of-ways-to-rearrange-sticks-with-k-sticks-visible/
class Solution {
    private   var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 1001), count: 1001)
    func rearrangeSticks(_ n: Int, _ k: Int) -> Int {
        if n == k {
            return 1
        }
        if k == 0 {
            return 0
        }
        if dp[n][k] == 0 {
            dp[n][k] = (rearrangeSticks(n - 1, k - 1) + rearrangeSticks(n - 1, k) * (n - 1)) % 1_000_000_007
        }
        return dp[n][k]
    }
}