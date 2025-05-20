//https://leetcode.com/problems/smallest-divisible-digit-product-i/

class Solution {
    func smallestNumber(_ n: Int, _ t: Int) -> Int {
        var ans = n
        while getDigitsProduct(of: ans) % t != 0 {
            ans += 1
        }
        return ans
    }
    private func getDigitsProduct(of num: Int) -> Int {
        var p = 1
        var t = num
        while t > 0 {
            p *= (t % 10)
            t /= 10
        }
        return p
    }
}