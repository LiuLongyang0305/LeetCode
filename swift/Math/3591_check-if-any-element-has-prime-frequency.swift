//https://leetcode.com/problems/check-if-any-element-has-prime-frequency/
func getPrimesBasedEratosthenesInner(_ n: Int) -> Set<Int> {
    var primes = Set<Int>()
    var isPrime = [Bool](repeating: true, count: n + 1)
    isPrime[0] = false
    isPrime[1] = false
    for i in 2...n {
        if isPrime[i] {
            primes.insert(i)
            guard i * i <= n else {continue}
            var j = 2 * i
            while j <= n {
                isPrime[j] = false
                j += i
            }
        }
    }
    return primes
}


let  primers = getPrimesBasedEratosthenesInner(100)

class Solution {
    func checkPrimeFrequency(_ nums: [Int]) -> Bool {
        var counter = [Int:Int]()
        for num in nums {
            counter[num,default: 0] += 1
        }
        for (_,cnt) in counter {
            if primers.contains(cnt)  {
                return true
            }
        }
        return false
    }
}
