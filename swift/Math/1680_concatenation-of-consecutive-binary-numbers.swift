// https://leetcode.com/problems/concatenation-of-consecutive-binary-numbers/
class Solution {
    private let MOD = 1_000_000_007
    func concatenatedBinary(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }
        var ans = 1
        for num in 2...n {
            ans = (ans << (64 - num.leadingZeroBitCount) | num) % MOD
        }
        return ans
    }
}