// https://leetcode.com/problems/minimum-factorization/
class Solution {
    func smallestFactorization(_ a: Int) -> Int {
        guard a > 9 else {
            return a
        }
        var temp = a
        var ans = 0
        var multi = 1
        for fac in (2...9).reversed() {
            while temp % fac == 0 {
                temp /= fac
                ans = multi * fac + ans
                guard ans < Int32.max else {
                    return 0
                }
                multi *= 10
            }
        }
        return temp == 1 ? ans : 0
    }
}