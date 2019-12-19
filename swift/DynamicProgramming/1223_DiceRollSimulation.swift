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


class Solution {
    private let MOD = 1_000_000_007
    func dieSimulator(_ n: Int, _ rollMax: [Int]) -> Int {
        guard n > 1 else {
            return 6
        }
        
        var dp = Array<Array<Array<Int>>>(repeating: Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: 17), count: 7), count: n + 1)
        
        for currentRollTime in 1...n {
            
            for rolledNumber in 1...6 {
                
                if currentRollTime  == 1 {
                    dp[currentRollTime][rolledNumber][1] = 1
                    continue
                }
                if rollMax[rolledNumber - 1] > 1 {
                    for continousCount in 2...rollMax[rolledNumber - 1] {
                        dp[currentRollTime][rolledNumber][continousCount]  = dp[currentRollTime - 1][rolledNumber][continousCount - 1]
                    }
                }
                
                var total = 0
                for lastRolledNumber in 1...6 {
                    if lastRolledNumber != rolledNumber {
                        for index in 1...15 {
                            total = (total + dp[currentRollTime - 1][lastRolledNumber][index]) % MOD
                        }
                    }
                }
                dp[currentRollTime][rolledNumber][1] = total
            }
        }
        var  ans = 0
        for rolledNumber in 1...6 {
            for c in dp[n][rolledNumber] {
                ans  = (ans + c) % MOD
            }
        }
        return ans % MOD
    }
 }
 Solution().dieSimulator(3, [1,1,1,2,2,3])

