// https://leetcode-cn.com/problems/ccw6C7/
class Solution {
    private let fac = [1,1,2,6,24,120,720]
    func paintingPlan(_ n: Int, _ k: Int) -> Int {
        guard k != 0 && k != n * n else {
            return 1
        }
        func cal(_ r: Int, _ c: Int) -> Int {
            return fac[n] / (fac[r] * fac[n - r]) * fac[n] / (fac[c] * fac[n - c])
        }
        var ans = 0
        for r in 0...n {
            for c in 0...n {
                if (r + c) * n - r * c == k {
                    ans += cal(r, c)
                }
            }
        }
        return ans
    }
}
