    // https://leetcode.cn/problems/the-number-of-ways-to-make-the-sum/
    class Solution {
        func numberOfWays(_ n: Int) -> Int {
            let mod = 1000000007
            let coins = [1, 2, 6]

            // 初始化 dp 数组，f[0] = 1
            var f = [Int](repeating: 0, count: n + 1)
            f[0] = 1

            // 完全背包：用硬币 1, 2, 6 凑金额
            for x in coins {
                if n >= x {
                    for j in x...n {
                        f[j] = (f[j] + f[j - x]) % mod
                    }
                }
            }

            // 加上额外的两种情况
            var ans = f[n]
            if n >= 4 {
                ans = (ans + f[n - 4]) % mod
            }
            if n >= 8 {
                ans = (ans + f[n - 8]) % mod
            }

            return ans
        }
    }

