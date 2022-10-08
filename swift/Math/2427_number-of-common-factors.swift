// https://leetcode.com/problems/number-of-common-factors/
class Solution {
    func commonFactors(_ a: Int, _ b: Int) -> Int {
        var ans = 0
        for i in 1...min(a, b) {
            if a % i == 0 && b % i == 0 {
                ans += 1
            }
        }
        return ans
    }
}