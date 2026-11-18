  // https://leetcode.cn/problems/game-of-divisible-sums/
    class Solution {
        func maxDifference(_ nums: [Int]) -> Int {
            let N = nums.count
            var memo = [Int](repeating: Int.min, count: N)
            func dfs(_ i: Int) -> Int {
                guard i < N else {return 0}
                if memo[i] != Int.min {
                    return memo[i]
                }
                let x = nums[i]
                var res = 0
                if x % 3 == 0 {
                    res = x - dfs(i + 1)
                } else {
                    res = x + dfs(i + 1)
                }

                if i < N - 1 {
                    var s = x + nums[i + 1]
                    if s % 3 == 0 {
                        s -= dfs(i + 2)
                    } else {
                        s += dfs(i + 2)
                    }
                    res = max(res,s)
                }
                memo[i] = res
                return res

            }
            return dfs(0)
        }
    }
