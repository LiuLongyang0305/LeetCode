//https://leetcode.com/problems/ugly-number-iii/
class Solution {
    func nthUglyNumber(_ n: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
        
        let ab = a * b / gcd(first: a, second: b)
        let bc = b * c / gcd(first: b, second: c)
        let ac = a * c / gcd(first: a, second: c)
        let abc = a * bc / gcd(first: a, second: bc)

        let minDivisor = min(a, b,c)
        var left = minDivisor
        var right = minDivisor * n
        
        while  left < right {
            let mid = left + (right - left) >> 1
            let count = mid / a + mid / b + mid / c - mid / ab - mid / ac - mid / bc + mid / abc
            if count >= n {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    private func gcd(first:Int, second:  Int) -> Int {
        return second == 0 ? first : gcd(first: second, second: first % second)
    }
}