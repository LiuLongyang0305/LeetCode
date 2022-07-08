// https://leetcode.com/problems/number-of-ways-to-reorder-array-to-get-same-bst/
class Solution {
    private let MOD = 1000000007
    ///阶乘数据预处理
    private var factorials = [Int](repeating: 1, count: 1005)
    init() {
        for i in 1...1004 {
            factorials[i] = factorials[i - 1] * i % MOD
        }
    }

    func numOfWays(_ nums: [Int]) -> Int {
        return (helper(nums) - 1 + MOD ) % MOD
    }

    ///快速幂
    private func fastPower(_ base:Int, _ exp: Int,_ mod: Int) -> Int {
        guard exp > 0 else {return 1}
        let t = fastPower(base, exp >> 1, mod)
        return t * t % MOD * (exp & 1 == 0 ? 1 : base) % MOD
    }
    ///组合数
    private func comb(_ n: Int, _ m: Int) -> Int {
        return factorials[n] * inv(factorials[n - m] * factorials[m] % MOD,MOD) % MOD
    }
    ///递归求解
    private func helper(_ arr: [Int]) -> Int {
        guard arr.count > 2 else {return 1}

        var left = [Int]()
        var right = [Int]()
        let N = arr.count
        for i in 1..<N {
            if arr[i] > arr[0] {
                right.append(arr[i])
            } else {
                left.append(arr[i])
            }
        }
        return comb(N - 1,left.count) * helper(left) % MOD * helper(right) % MOD
    }

    ///求逆元
    private func inv(_ num: Int, _ mod: Int) -> Int {
        return fastPower(num, mod - 2, mod)
    }
}