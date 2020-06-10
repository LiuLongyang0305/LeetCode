// https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof/
class Solution {
    private let MOD = 1_000_000_007
    func numWays(_ n: Int) -> Int {
        
        guard n > 2 else {
            return max(n, 1)
        }
        
        var oneStepBefore = 2
        var twoStepBefore = 1
        for _ in 3...n {
            let temp = oneStepBefore + twoStepBefore
            twoStepBefore = oneStepBefore % MOD
            oneStepBefore = temp % MOD
        }
        return oneStepBefore 
    }
}