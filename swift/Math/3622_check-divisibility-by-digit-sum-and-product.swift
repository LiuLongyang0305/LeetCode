//https://leetcode.cn/problems/check-divisibility-by-digit-sum-and-product/
class Solution {
    func checkDivisibility(_ n: Int) -> Bool {
        var sum = 0
        var product = 1
        var t = n
        while t > 0 {
            let a = t % 10
            sum += a
            product *= a
            t /= 10
        }
        return n % (sum + product) == 0
    }
}
