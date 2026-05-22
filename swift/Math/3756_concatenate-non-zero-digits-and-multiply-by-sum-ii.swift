    // https://leetcode.cn/problems/concatenate-non-zero-digits-and-multiply-by-sum-ii/
var  powOf10 = [1]
let MOD = 1_000_000_007
for e in 1...100005 {
    powOf10.append(powOf10[e - 1] * 10 % MOD )
}
let zero = Character("0").asciiValue!
    class Solution {
        func sumAndMultiply(_ s: String, _ queries: [[Int]]) -> [Int] {
            var prefixSum = [0]
            var prefixLength = [0]
            var prefixNumber = [0]
            var i =  0
            for ch in s {
                let digit  = Int(ch.asciiValue! - zero)
                prefixSum.append(prefixSum[i] + digit)
                prefixLength.append(prefixLength[i]  + (digit ==  0 ? 0 : 1))
                prefixNumber.append(digit == 0 ? prefixNumber[i] : ((10  * prefixNumber[i] + digit) % MOD))
                i += 1
            }
            var sb = [Int]()
            for q in  queries {
                let l = q[0], r  = q[1]
                let sum = prefixSum[r + 1] - prefixSum[l]
                let x = ((prefixNumber[r + 1] - prefixNumber[l] * powOf10[prefixLength[r + 1]  - prefixLength[l]]) % MOD  + MOD) % MOD
                sb.append(x * sum %  MOD)
            }
            return sb
        }
    }

