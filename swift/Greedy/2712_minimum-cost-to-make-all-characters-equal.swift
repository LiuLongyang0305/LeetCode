//https://leetcode.com/problems/minimum-cost-to-make-all-characters-equal/
class Solution {
    func minimumCost(_ s: String) -> Int {
        var ans = 0
        let N = s.count
        let chars = [Character](s)
        for i in 1..<chars.count {
            if chars[i - 1] != chars[i] {
                ans += min(i, N - i)
            }
        }
        return ans
    }
}
