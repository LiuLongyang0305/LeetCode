// https://leetcode.com/problems/count-ways-to-make-array-with-product/
class Solution {


    private var primes = [Int]()
    private var factorial = [Int]()
    private var inverse = [Int]()
    private let MOD = 1_000_000_007
    private let N = 10050;
    init() {
        getPrimes(10000)
        factorial.append(1)
        inverse.append(1)
        for i in 1...N {
            factorial.append(factorial.last! * i % MOD)
            inverse.append(fastPowerInner(factorial[i], MOD - 2, MOD))
        }
    }
    func waysToFillArray(_ queries: [[Int]]) -> [Int] {
        var ans = [Int]()
        for query in queries {
            let (n,k) = (query[0],query[1])
            var waysCnt = 1
            for prime in primes {
                guard prime <= k else {break}
                if k % prime == 0 {
                    let s = counterInner(k, prime)
                    waysCnt = waysCnt * caculated(n + s - 1, n - 1) % MOD
                }
            }
            ans.append(waysCnt)
        }
        return ans
    }

    private func getPrimes(_ n: Int){
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
    }


    private func fastPowerInner(_ base: Int, _ exp: Int,_ mod: Int) -> Int {
        guard exp > 0 else {return 1}
        var t = fastPowerInner(base, exp >> 1,mod)
        t = t * t % mod
        return (0 == exp & 1) ? t : (t * base % mod)
    }


    private func counterInner(_ n: Int, _ prime: Int) -> Int {
        var ans = 0
        var t = n
        while t % prime == 0 {
            ans += 1
            t /= prime
        }
        return ans
    }

    private func caculated(_ a:Int, _ b: Int) -> Int {
        return factorial[a] * inverse[b] % MOD * inverse[a - b] % MOD
    }
}