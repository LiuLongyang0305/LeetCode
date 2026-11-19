    // https://leetcode.cn/problems/sum-of-compatible-numbers-in-range-ii/
    class Solution {
        private typealias Pair = (cnt: Int, sum: Int)
        private let MOD = 1_000_000_007
        func sumOfGoodIntegers(_ n: Int, _ k: Int) -> Int {
            let low = max(n - k,1)
            let high = n + k
            let M = Int.bitWidth - high.leadingZeroBitCount
            var memo = [Pair?](repeating: nil, count: M )


            func dfs(_ i: Int, _ limitLow: Bool, _ limitHigh: Bool) -> Pair {
                guard i >= 0 else {
                    return (1,0)
                }
                if !limitLow && !limitHigh && nil != memo[i] {
                    return memo[i]!
                }
                let lo = limitLow ? (low >> i & 1) : 0
                let hi = limitHigh ? (high >> i & 1) : 1
                let h = (n >> i & 1) > 0 ? 0 : hi
                var cnt = 0
                var sum = 0
                for d in stride(from: lo, through: h, by: 1) {
                    let sub = dfs(i - 1, limitLow && d == lo, limitHigh && d == hi)
                    cnt += sub.cnt
                    cnt %= MOD
                    sum += sub.sum
                    sum %= MOD
                    sum += ((d << i) % MOD * sub.cnt) % MOD
                    sum %= MOD
                }
                let ans: Pair = (cnt,sum)
                if !limitLow && !limitHigh {
                    memo[i] = ans
                }
                return ans
            }
            return dfs(M - 1, true, true).sum
        }
    }
