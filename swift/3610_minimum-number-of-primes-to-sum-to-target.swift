    // https://leetcode.cn/problems/minimum-number-of-primes-to-sum-to-target/
func _sieveOfEratosthenes(limit: Int) -> [Int] {
    var isPrime = Array(repeating: true, count: limit + 1)
    isPrime[0] = false
    isPrime[1] = false // 0 和 1 不是质数

    for p in 2..<Int(Double(limit).squareRoot() + 1) {
        if isPrime[p] {
            for multiple in stride(from: p * p, through: limit, by: p) {
                isPrime[multiple] = false
            }
        }
    }

        // 提取所有质数
    var primes = [Int]()
    for num in 2..<isPrime.count {
        if isPrime[num] {
            primes.append(num)
        }
    }

    return primes
}
let possibleUesdPrimers = _sieveOfEratosthenes(limit: 10000)
class Solution {
    private let INF = 1_000_000_007
    func minNumberOfPrimes(_ n: Int, _ m: Int) -> Int {
        let candidate = [Int](possibleUesdPrimers.prefix(m))
        let primersSet = Set<Int>(candidate)

        var memo = [Int?](repeating: nil, count: n + 5)

        func dfs(_ cur: Int) -> Int {
            guard cur > 1 else {return INF}
            guard !primersSet.contains(cur) else {return 1}
            if let v = memo[cur] {return v}
            var sb = INF
            for split in 2..<(cur - 1) {
                sb = min(sb,dfs(split) + dfs(cur - split))
            }
            memo[cur] = sb
            return sb
        }

        let sb = dfs(n)
        return sb >= INF ? -1 : sb
    }
}
