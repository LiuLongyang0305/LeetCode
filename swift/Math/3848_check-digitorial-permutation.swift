//https://leetcode.cn/problems/check-digitorial-permutation
class Solution {
    let fac = [1,1,2,6,24,120,720,5040,40320,362880]
    func isDigitorialPermutation(_ n: Int) -> Bool {
        let sum = cal(n)
        return "\(sum)".sorted() == "\(n)".sorted()
    }

    func cal(_ num: Int) -> Int {
        var sb = 0
        var temp = num
        while temp > 0 {
            sb += fac[temp % 10]
            temp /= 10
        }
        return sb
    }
}
