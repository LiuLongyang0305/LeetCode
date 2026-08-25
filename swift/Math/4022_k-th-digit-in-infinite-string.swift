//https://leetcode.cn/problems/k-th-digit-in-infinite-string/
class Solution {
    func kthDigit(_ k: Int) -> Int {
        var curK = k - 1
        var cnt = 9
        var length = 1
        while cnt * length <= curK {
            curK -= cnt * length
            cnt *= 10
            length += 1
        }
        var x = cnt / 9 + curK / length
        if x / 10 % 2 > 0 {
            x += 9 - x % 10 * 2
        }
        for _ in 0..<(length - curK % length - 1) {
            x /= 10
        }
        return x % 10
    }
}
