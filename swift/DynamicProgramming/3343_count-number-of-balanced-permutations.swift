// https://leetcode.cn/problems/count-number-of-balanced-permutations/
let MOD = 1_000_000_007
// 快速幂取模 (a^b % mod)
func power(_ a: Int, _ b: Int, _ mod: Int) -> Int {
    var res = 1
    var base = a % mod
    var exp = b
    while exp > 0 {
        if exp & 1 == 1 {
            res = (res * base) % mod
        }
        base = (base * base) % mod
        exp >>= 1
    }
    return res
}

// 求逆元 (x^(-1) mod MOD)
func modInverse(_ x: Int) -> Int {
    return power(x, MOD - 2, MOD)
}


struct Combinatorics {
    private var fact: [Int]      // 阶乘
    private var invFact: [Int]   // 阶乘的逆元

    init(maxN: Int) {
        fact = Array(repeating: 1, count: maxN + 1)
        invFact = Array(repeating: 1, count: maxN + 1)

        // 计算阶乘
        for i in 1...maxN {
            fact[i] = (fact[i-1] * i) % MOD
        }

        // 计算最大阶乘的逆元
        invFact[maxN] = modInverse(fact[maxN])

        // 反向递推计算逆元
        for i in stride(from: maxN - 1, through: 0, by: -1) {
            invFact[i] = (invFact[i + 1] * (i + 1)) % MOD
        }
    }

    // 组合数 C(n, k)
    func C(_ n: Int, _ k: Int) -> Int {
        if k < 0 || k > n { return 0 }
        let numerator = fact[n]
        let denominator = (invFact[k] * invFact[n - k]) % MOD
        return (numerator * denominator) % MOD
    }
}

let comb = Combinatorics(maxN: 82)
class Solution {
    func countBalancedPermutations(_ num: String) -> Int {
        var counter = [Int](repeating: 0, count: 10)
        for ch in num {
            counter[Int("\(ch)")!] += 1
        }
            // print(counter)
        let N = num.count
        var memo = [Int:Int]()

        func dfs(_ curNum: Int, _ diff: Int, _ remainOdd: Int, _ remainEven: Int) -> Int {

            guard curNum <= 9 else {
                return (diff == 0 && remainOdd == 0 && remainEven == 0) ? 1 : 0
            }
            let key = "\(curNum)-\(diff)-\(remainOdd)-\(remainEven)".hashValue
            if let sb = memo[key] {
                return sb
            }
            guard counter[curNum] > 0 else {return dfs(curNum + 1, diff, remainOdd, remainEven)}
            var sb = 0
            for i in 0...counter[curNum] {
                guard i <= remainOdd else {break}
                let j = counter[curNum] - i
                if j <= remainEven {
                    sb += (comb.C(remainOdd, i) * comb.C(remainEven, j) % MOD) * dfs(curNum + 1, diff + (i - j) * curNum, remainOdd - i, remainEven - j) % MOD
                    sb %= MOD
                }
            }
            memo[key] = sb
            return sb
        }


        return  dfs(0, 0, N / 2, (N + 1) / 2)
    }
}
