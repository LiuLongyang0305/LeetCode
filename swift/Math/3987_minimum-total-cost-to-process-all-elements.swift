// https://leetcode.cn/problems/minimum-total-cost-to-process-all-elements/
struct ModMath {
    static let MOD = 1_000_000_007

    static func modPow(_ base: Int, _ exp: Int) -> Int {
        var result = 1
        var b = base % MOD
        var e = exp

        while e > 0 {
            if e & 1 == 1 {
                result = (result * b) % MOD
            }
            b = (b * b) % MOD
            e >>= 1
        }
        return result
    }

    static func modInverse(_ x: Int) -> Int {
        return modPow(x, MOD - 2)
    }

    static func multiplyDivideMod(_ m: Int, _ n: Int, _ k: Int) -> Int {
        let numerator = (m % MOD) * (n % MOD) % MOD
        let kInv = modInverse(k)
        return (numerator * kInv) % MOD
    }
}
class Solution {

    func minimumCost(_ nums: [Int], _ k: Int) -> Int {
        var addTime = 0
        var curResource = k

        for num in nums {
            if curResource >= num {
                curResource -= num
            } else {
                let totalNeed = num - curResource
                var curAddTime = totalNeed / k
                if totalNeed % k != 0 {
                    curAddTime += 1
                }
                addTime += curAddTime
                curResource = curResource + curAddTime * k - num
            }
        }

        return ModMath.multiplyDivideMod(1 + addTime, addTime, 2)
    }
}
