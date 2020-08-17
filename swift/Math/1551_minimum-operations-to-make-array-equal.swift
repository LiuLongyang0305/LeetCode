// https://leetcode.com/problems/minimum-operations-to-make-array-equal/
class Solution {
    func minOperations(_ n: Int) -> Int {
        var ans = 0
        let target =  (n >> 1) << 1 + 1
        for i in 0..<n {
            ans += abs( i  << 1 + 1 - target)
        }
        return ans >> 1
    }
}

