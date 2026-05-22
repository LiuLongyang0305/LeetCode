//https://leetcode.cn/problems/balanced-k-factor-decomposition/
func findAllFactorsByPrimeFactorization(of number: Int) -> [Int] {
    if number == 0 { return [] }
    if number == 1 { return [1] }

    var n = number
    var primeFactors: [Int: Int] = [:] // 存储质因数及其指数

        // 处理因子2
    var count = 0
    while n % 2 == 0 {
        count += 1
        n /= 2
    }
    if count > 0 {
        primeFactors[2] = count
    }

        // 处理奇数因子
    var factor = 3
    while factor * factor <= n {
        count = 0
        while n % factor == 0 {
            count += 1
            n /= factor
        }
        if count > 0 {
            primeFactors[factor] = count
        }
        factor += 2
    }

        // 如果最后n是质数
    if n > 1 {
        primeFactors[n] = 1
    }

        // 生成所有因子组合
    var factors = [1]
    for (prime, exponent) in primeFactors {
        var newFactors: [Int] = []
        for existingFactor in factors {
            var power = 1
            for _ in 1...exponent {
                power *= prime
                newFactors.append(existingFactor * power)
            }
        }
        factors.append(contentsOf: newFactors)
    }

    return Array(Set(factors)).sorted() // 去重并排序
}

let allFactors = (0...100000).map { findAllFactorsByPrimeFactorization(of: $0)}
class Solution {
    func minDifference(_ n: Int, _ k: Int) -> [Int] {
        var minDiff = 1000007
        var sb = [Int]()

        func dfs(_ path: [Int], _ remain: Int, _ remainK: Int) {

            if path.isEmpty {
                for i in allFactors[remain] {
                    dfs([i], remain / i, remainK - 1)
                }

            } else {
                if remainK == 0 {
                    let tmp = path[k - 1] - path[0]
                    if tmp < minDiff {
                        sb = path
                        minDiff = tmp
                    }

                } else if remainK == 1 {
                    guard remain >= path.last! else {return}
                    dfs(path + [remain], 1, 0)

                } else {

                    for i in allFactors[remain] {
                        if i >= path.last! {
                            dfs(path + [i], remain / i, remainK - 1)
                        }
                    }

                }
            }


        }

        dfs([],n,k)
        return sb
    }
}
