// https://leetcode.com/problems/elimination-game/
class Solution {
    func lastRemaining(_ n: Int) -> Int {
        return n == 1 ? 1 :  ( n >> 1 + 1 - lastRemaining(n >> 1)) << 1
    }
}