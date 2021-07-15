// https://leetcode-cn.com/problems/cutting-ribbons/
class Solution {
    func maxLength(_ ribbons: [Int], _ k: Int) -> Int {
        guard ribbons.reduce(0, { $0 + $1}) >= k else {
            return 0
        }
        var left = 1
        var right = ribbons.max()!
        while left < right {
            let mid = (right + left + 1) >> 1
            let flag = ribbons.reduce(0) { $0 + ($1 / mid)} >= k
            if flag {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return left
    }
}