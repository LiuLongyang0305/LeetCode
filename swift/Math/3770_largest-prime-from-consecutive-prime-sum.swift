    // https://leetcode.cn/problems/largest-prime-from-consecutive-prime-sum/
func getPrimesBasedEularInner(_ n: Int) -> [Int] {
    var primes = [Int]()
    var isPrime = [Bool](repeating: true, count: n + 1)
    isPrime[0] = false
    isPrime[1] = false
    for i in 2...n {
        if isPrime[i] {
            primes.append(i)
        }
        for prime in primes {
            guard i * prime <= n else {break}
            isPrime[i * prime] = false
            //精髓所在
            if 0 == i % prime {
                break
            }
        }
    }

    return primes
}
let MX = 500005
let primers = getPrimesBasedEularInner(MX)
let primersSet = Set<Int>(primers)
var specialPrimers = [Int]()
var sum = 0
for p in primers {
    sum += p
    if primersSet.contains(sum) {
        specialPrimers.append(sum)
    }

}

    class Solution {
        func largestPrime(_ n: Int) -> Int {
            if n <= 1 {return 0}
            let M = specialPrimers.count
            var l = 0
            var r = M - 1
            while l < r {
                let mid = (l + r + 1) / 2
                if specialPrimers[mid] <= n {
                    l = mid
                } else {
                    r = mid - 1
                }
            }
            return specialPrimers[l]
        }
    }
