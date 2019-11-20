//https://leetcode.com/problems/super-ugly-number/
class Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        var dp = Array<Int>(repeating: 0, count: n)
        var currentP = Array<Int>(repeating: 0, count: primes.count)
        var potential = Array<Int>(repeating: 0, count: primes.count)

        dp[0] = 1
        for i in 1..<n {
            var minEle = Int.max
            for j in 0..<primes.count {
                potential[j] = primes[j] * dp[currentP[j]]
                if potential[j] < minEle {
                    minEle = potential[j]
                }
            }
            for j in 0..<primes.count {
                if potential[j] <= minEle {
                    currentP[j] += 1
                }
            }
            dp[i] = minEle
        }
        return dp[n - 1]
    }
}