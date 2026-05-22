//https://leetcode.cn/problems/gcd-of-odd-and-even-sums/
class Solution {
    func gcdOfOddEvenSums(_ n: Int) -> Int {
        let maxOdd = 2 * n - 1
        let sumOdd = n * (1 + maxOdd) / 2
        let sumEven = sumOdd + n
        return gcd(sumEven,sumOdd)
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        if a > b {
            return gcd(b, a % b)
        }
        return gcd(b,a)
    }
}
