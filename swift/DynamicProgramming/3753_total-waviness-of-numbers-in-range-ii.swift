 //https://leetcode.cn/problems/total-waviness-of-numbers-in-range-ii/
        class Solution {
        private var s: [Character] = []
        private var n: Int = 0
        private var memo_cnt: [[[Int]]] = []
        private var memo_sum: [[[Int]]] = []

        func totalWaviness(_ num1: Int, _ num2: Int) -> Int {
            return solve(num2) - solve(num1 - 1)
        }

        private func solve(_ num: Int) -> Int {
            if num < 100 {
                return 0
            }
            let str = String(num)
            s = Array(str)
            n = s.count

            // 初始化记忆化数组，大小为 16×10×10，全部设为 -1
            memo_cnt = Array(
                repeating: Array(
                    repeating: Array(repeating: -1, count: 10),
                    count: 10
                ),
                count: 16
            )
            memo_sum = Array(
                repeating: Array(
                    repeating: Array(repeating: -1, count: 10),
                    count: 10
                ),
                count: 16
            )

            let result = dfs(0, -1, -1, true, true)
            return result.sum
        }

        private func dfs(
            _ pos: Int,
            _ prev: Int,
            _ curr: Int,
            _ isLimit: Bool,
            _ isLeading: Bool
        ) -> (cnt: Int, sum: Int) {
            if pos == n {
                return (1, 0)
            }

            // 只有在不受上限限制且不包含前导零时才使用记忆化
            if !isLimit && !isLeading && prev >= 0 && curr >= 0 {
                let cnt = memo_cnt[pos][prev][curr]
                let sum = memo_sum[pos][prev][curr]
                if cnt != -1 {
                    return (cnt, sum)
                }
            }

            var cnt: Int = 0
            var sum: Int = 0
            let up = isLimit ? Int(String(s[pos]))! : 9

            for digit in 0...up {
                let newLeading = isLeading && (digit == 0)
                let newPrev = curr
                let newCurr = newLeading ? -1 : digit
                let sub = dfs(pos + 1, newPrev, newCurr, isLimit && (digit == up), newLeading)
                let subCnt = sub.cnt
                let subSum = sub.sum

                // 不包含前导零时才计算波动值
                if !newLeading && prev >= 0 && curr >= 0 {
                    // 数位为峰或为谷时，更新当前的波动值
                    if (prev < curr && curr > digit) || (prev > curr && curr < digit) {
                        sum += subCnt
                    }
                }

                cnt += subCnt
                sum += subSum
            }

            if !isLimit && !isLeading && prev >= 0 && curr >= 0 {
                memo_cnt[pos][prev][curr] = cnt
                memo_sum[pos][prev][curr] = sum
            }

            return (cnt, sum)
        }
    }

