// https://leetcode-cn.com/problems/shu-zhi-de-zheng-shu-ci-fang-lcof/
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var base = n < 0 ? 1 / x : x
        var index = n < 0 ? -n : n
        var result : Double = 1
        while  index > 0 {
            if index & 1 != 0 {
                result *= base
            }
            base *= base
            index = index >> 1
        }
        return result
    }
}