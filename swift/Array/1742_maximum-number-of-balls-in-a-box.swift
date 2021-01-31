//https://leetcode.com/problems/maximum-number-of-balls-in-a-box/
extension Int {
    var sumOfDigits: Int {
        var ans = 0
        var temp = self
        while temp > 0 {
            ans += (temp % 10)
            temp /= 10
        }
        return ans
    }
}
class Solution {
    func countBalls(_ lowLimit: Int, _ highLimit: Int) -> Int {
        var cnt = Array<Int>(repeating: 0, count: 50)
        (lowLimit...highLimit).forEach {cnt[$0.sumOfDigits] += 1}
        return cnt.max()!
    }
}

