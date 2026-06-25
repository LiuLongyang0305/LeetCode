//https://leetcode.cn/problems/find-nth-smallest-integer-with-k-one-bits/
struct Combinatorics2 {

    private let maxM = 50
    private var c: [[Int]]

    init() {
        // 初始化二维数组
        c = Array(
            repeating: Array(repeating: 0, count: maxM + 1),
            count: maxM + 1
        )

        // 预处理组合数
        for m in 0...maxM {
            c[m][0] = 1
            // c[m][m] = 1
            if m > 0 {
                for n in 1...m {
                    c[m][n] = c[m - 1][n - 1] + c[m - 1][n]
                }
            }
        }
    }

    /// 获取组合数 C(m, n)
    func comb(_ m: Int, _ n: Int) -> Int {
        if n < 0 || n > m { return 0 }
        return c[m][n]
    }
}
let com = Combinatorics2()
class Solution {

    func nthSmallest(_ n: Int, _ k: Int) -> Int {
        var ans = 0
        var remainN = n
        var remainK = k
        for i in stride(from: 50, through: 0, by: -1) {
            let c = com.comb(i, remainK)
            if remainN > c {
                remainN -= c
                ans = ans | (1 << i)
                remainK -= 1
            }
        }
        return ans
    }
}
