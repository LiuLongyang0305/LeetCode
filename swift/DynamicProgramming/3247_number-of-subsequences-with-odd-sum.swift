    // https://leetcode.cn/problems/number-of-subsequences-with-odd-sum/
    class Solution {
        let MOD = 1_000_000_007
        func subsequenceCount(_ nums: [Int]) -> Int {


            let M = nums.count
            var memo = [[Int?]](repeating: [Int?](repeating: nil, count: 2), count: M + 5)
            func dfs(_ idx: Int, _ odd: Bool) -> Int {
                guard idx < M else {return odd ? 1 : 0}
                if let v = memo[idx][odd ? 0 : 1] {
                    return v
                }
                var sb = dfs(idx + 1, odd) % MOD
                let flag = nums[idx] & 1 == 1
                sb += dfs(idx + 1, flag != odd) % MOD
                sb %= MOD
                memo[idx][odd ? 0 : 1] = sb
                return sb
            }



            return dfs(0, false)
        }
    }
