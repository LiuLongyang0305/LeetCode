//https://leetcode.com/problems/count-primes/
class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n < 2 {
            return 0
        }
        if n == 2  {
            return 0
        }
        if n == 3 {
            return 1
        }

        var ans = 2
        for  i in 4..<n {
            
            if isPrimeNumber(num: i) {
                ans += 1
            }
        }
        return ans
    }
    
    private func isPrimeNumber(num: Int) -> Bool {
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 {
                return false
            }
        }
        return true
    }
}

Solution().countPrimes(10)