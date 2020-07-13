// https://leetcode.com/problems/stone-game-iv/
class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        var dp = Array<Bool>(repeating: false, count: n + 1)
        for i in 1...n {
            var j = 1
            while j * j <= i {
                if !dp[i - j * j] {
                    dp[i] = true
                    break
                }
                j += 1
            }
        }
        return dp[n]
    }
}

