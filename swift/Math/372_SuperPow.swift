//https://leetcode.com/problems/super-pow/
class Solution {
    private  let MOD = 1337
    func myPow(_ a: Int, _ k: Int) -> Int {
        let base = a % 1337
        guard k != 0 else {
            return 1
        }
        if k % 2 == 0 {
            let temp = myPow(base, k >> 1) % MOD
            return temp * temp % MOD
        } else {
            return  base * myPow(base, k - 1) % MOD
        }
    }
    func superPow(_ a: Int, _ b: [Int]) -> Int {
        guard !b.isEmpty else {
            return 1
        }
        var index = 0
        let N = b.count
        var ans = 1
        while index < b.count {
            var base = 1
            var i = 0
            var num = 0
            while index < N && i < 9 {
                num *= 10
                num += b[index]
                i += 1
                base *= 10
                index += 1
            }
            ans = myPow(a, num) * myPow(ans, base) % MOD
        }
        return ans
    }
 }
 


