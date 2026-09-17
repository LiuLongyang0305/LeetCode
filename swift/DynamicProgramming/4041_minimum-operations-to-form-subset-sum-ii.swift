//https://leetcode.cn/problems/minimum-operations-to-form-subset-sum-ii/
    class Solution {
        private let INF = Int.max / 2
        func minOperations(_ nums: [Int], _ sum: Int) -> Int {
            let M = nums.count
            var memo = [[Int?]](repeating: [Int?](repeating: nil, count: sum + 5), count: M + 5)
            func dfs(_ idx: Int, _ remain: Int) -> Int {
                guard remain > 0 else {return 0}
                guard idx < M else {return INF}
                if let v = memo[idx][remain] {
                    return v
                }
                var sb = dfs(idx + 1, remain)
                let x = nums[idx]
                var a = 0
                while (x >> a) > 0 {
                    var b = 0
                    var val = (x >> a) << b
                    while val <= remain {
                        sb = min(sb,dfs(idx + 1, remain - val) + a + b)
                        b += 1
                        val = (x >> a) << b
                    }
                    a += 1
                }
                memo[idx][remain] = sb
                return sb

            }

            let sb = dfs(0, sum)

            return sb >= INF ? -1 : sb
        }
    }
