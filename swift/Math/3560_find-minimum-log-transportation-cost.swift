//https://leetcode.com/problems/find-minimum-log-transportation-cost/
class Solution {
    func minCuttingCost(_ n: Int, _ m: Int, _ k: Int) -> Int {
        return cal(n, k) + cal(m, k)
    }

    private func cal(_ length: Int, _ limit: Int) -> Int {
        return length <= limit ? 0 : limit * (length - limit)
    }
}
