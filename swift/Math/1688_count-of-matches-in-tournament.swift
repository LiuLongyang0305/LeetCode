// https://leetcode.com/problems/count-of-matches-in-tournament/
class Solution {
    func numberOfMatches(_ n: Int) -> Int {
        return n == 1 ? 0 : (n >> 1 + numberOfMatches(n >> 1 + (n % 2 == 0 ? 0 : 1)))
    }
}