// https://leetcode.com/problems/dice-roll-simulation/
class Solution {
    private let MOD = 1_000_000_007
    func dieSimulator(_ n: Int, _ rollMax: [Int]) -> Int {
        guard n > 1 else {
            return 6
        }

        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 17), count: 6)
        for row in 0..<6 {
            dp[row][1] = 1
        }
        for _ in 2...n {
            var dp2 = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 17), count: 6)
            for lastRolledNumber in 0..<6 {
                for continousCount in 1...rollMax[lastRolledNumber] + 1 {
                    for rolledNumber in 0..<6 {
                        if rolledNumber  == lastRolledNumber {
                            if continousCount < rollMax[rolledNumber] {
                                dp2[rolledNumber][continousCount + 1] += (dp[rolledNumber][continousCount]  % MOD)
                            }
                        } else {
                            dp2[rolledNumber][1] += (dp[lastRolledNumber][continousCount] % MOD)
                        }
                    }
                }
            }
            dp = dp2
        }
        var  ans = 0
        for row in dp {
            for count in row {
                ans  += count
            }
        }
        return ans % MOD
    }
 }

