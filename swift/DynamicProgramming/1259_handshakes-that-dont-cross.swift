//https://leetcode.com/problems/handshakes-that-dont-cross/
extension Int {
    static var mod: Int {
        return 1_000_000_007
    }
}

class Solution {

    func numberOfWays(_ num_people: Int) -> Int {
        let m = num_people >> 1
        var dp = Array<Int>(repeating: 0, count: m + 1)
        dp[0] = 1
        for i in 1...m {
            var temp = 0
            for j in 0..<i {
                temp = (temp + dp[j] * dp[i - 1 - j]) % Int.mod
            }
            dp[i] = temp
        }
        return dp[m]
    }
}