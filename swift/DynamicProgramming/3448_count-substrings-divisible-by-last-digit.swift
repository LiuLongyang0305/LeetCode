    //https://leetcode.cn/problems/count-substrings-divisible-by-last-digit
class Solution {
    func countSubstrings(_ s: String) -> Int {
        var ans: Int = 0
        // f[m][r] 表示模数为 m 时，余数为 r 的子串数量
        // m 的范围是 1...9，r 的范围是 0...(m-1)，最多到 8
        // 为了简便，我们固定第二维为 9
        var f: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 10)

        // 将字符串转换为数字数组以提高性能
        let digits = s.compactMap { Int(String($0)) }

        for d in digits {
            for m in 1...9 { // 枚举模数 m
                // 滚动数组计算 f
                var nf = Array(repeating: 0, count: 9)
                nf[d % m] = 1 // 以当前数字开头（作为长度为1的子串）

                for rem in 0..<m { // 枚举模 m 的余数 rem
                    // 刷表法：在原有子串后添加当前数字 d
                    let newRem = (rem * 10 + d) % m
                    nf[newRem] += f[m][rem]
                }

                f[m] = nf
            }
            // 以当前数字 d 结尾的，模 d 余数为 0 的子串个数
            // 注意：当 d 为 0 时，f[0][0] 始终为 0，符合要求
            ans += Int(f[d][0])
        }

        return ans
    }
}
