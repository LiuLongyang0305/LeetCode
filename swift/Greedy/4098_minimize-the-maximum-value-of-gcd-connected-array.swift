//https://leetcode.cn/problems/minimize-the-maximum-value-of-gcd-connected-array/
/// 埃拉托色尼筛法：生成 2...limit 的全部质数
func sieve(limit: Int) -> [Int] {
    guard limit >= 2 else { return [] }
    var isPrime = [Bool](repeating: true, count: limit + 1)
    isPrime[0] = false
    isPrime[1] = false

    let boundary = Int(Double(limit).squareRoot())
    for i in 2...boundary where isPrime[i] {
        for j in stride(from: i * i, through: limit, by: i) {
            isPrime[j] = false
        }
    }

    return (2...limit).compactMap { isPrime[$0] ? $0 : nil }
}



func isPrimeUsingTable(_ n: Int, primers:[Int]) -> (Bool,Int?) {
    guard n > 1 else { return (false,nil) }

    for p in primers {
        if p * p > n { break }
        if n % p == 0 {
            if n == p {
                return (true,nil)
            } else {
                return (false,p)
            }
        }
    }
    return (true,nil)
}

let primers = sieve(limit: Int(sqrt(Double(1000000001))) + 1)

class Solution {
    func minimumMaxValue(_ n: Int, _ index: Int, _ value: Int) -> Int {
        guard value != 1 else {return -1}
        let checkRes = isPrimeUsingTable(value, primers: primers)
        if checkRes.0 {
            guard index == 0 else {return -1}
        } else {
            let minP = checkRes.1!
            guard getMaxCnt(value, minP) >= index + 1 else {
                return -1
            }

        }

        if value & 1 == 0 {
            return value + (n - 1 - index) * 2
        } else {
            let p =  checkRes.0 ? value : (checkRes.1 ?? 0)
            if n - 1 == index {
                return value
            }
            return (value + p) + 2 * (n - 2 - index)
        }
    }

    private func getMaxCnt(_ num: Int, _ minP: Int) -> Int {
        if num & 1 == 0 {
            return num / 2
        }
        return 1 + (num - minP) / 2
    }
}
