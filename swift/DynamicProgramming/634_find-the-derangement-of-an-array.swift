// https://leetcode.com/problems/find-the-derangement-of-an-array/
class Solution {
    func findDerangement(_ n: Int) -> Int {
        guard n > 1 else {
            return n == 0 ? 1 : 0
        }
        var lastLast = 1
        var last = 0
        for i  in 2...n {
            let t = ((i - 1) * (last + lastLast)) % 1_000_000_007
            (last,lastLast) = (t,last)
        }
        return last
    }
}
