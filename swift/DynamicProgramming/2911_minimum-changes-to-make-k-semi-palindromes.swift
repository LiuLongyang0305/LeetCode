class Solution {
    private let MX = 201
    private var divisors = [[Int]]()
    private let INF = Int.max / 2

    init() {
        divisors = [[Int]](repeating: [], count: MX)
        for i in 1..<MX {
            for j in stride(from: 2 * i, to: MX, by: i) {
                divisors[j].append(i)
            }
        }
    }

    func minimumChanges(_ s: String, _ k: Int) -> Int {
        let chars = Array(s)
        let n = chars.count

        let cost = calculateModifyArray(chars)

        var memo = [[Int]](repeating: [Int](repeating: -1, count: k + 1), count: n + 1)

        func dfs(_ start: Int, _ remainK: Int) -> Int {
            if remainK == 0 {
                return start == n ? 0 : INF
            }

            // 剩余字符数量不足以组成 remainK 个长度 >= 2 的子串
            if n - start < 2 * remainK {
                return INF
            }

            if memo[start][remainK] != -1 {
                return memo[start][remainK]
            }

            // 最后一段直接使用 start...n-1
            if remainK == 1 {
                let ans = cost[start][n - 1]
                memo[start][remainK] = ans
                return ans
            }

            var ans = INF

            // 当前子串至少长度 2
            // 后面还要留下 2 * (remainK - 1) 个字符
            let maxRight = n - 2 * (remainK - 1) - 1

            if start <= maxRight {
                for right in start + 1...maxRight {
                    let next = dfs(right + 1, remainK - 1)

                    if next != INF {
                        ans = min(ans, cost[start][right] + next)
                    }
                }
            }

            memo[start][remainK] = ans
            return ans
        }

        return dfs(0, k)
    }

    private func calculateModifyArray(_ chars: [Character]) -> [[Int]] {
        let n = chars.count

        var cost = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)

        for left in 0..<n {
            for right in left + 1..<n {
                cost[left][right] = cal(chars, left, right)
            }
        }

        return cost
    }

    private func cal(_ chars: [Character], _ left: Int, _ right: Int) -> Int {
        let len = right - left + 1
        var ans = INF

        for d in divisors[len] {
            var changes = 0

            // 每个 residue group 分别形成回文
            for offset in 0..<d {
                var l = left + offset
                var r = left + offset + (len / d - 1) * d

                while l < r {
                    if chars[l] != chars[r] {
                        changes += 1
                    }

                    l += d
                    r -= d
                }
            }

            ans = min(ans, changes)
        }

        return ans
    }
}
