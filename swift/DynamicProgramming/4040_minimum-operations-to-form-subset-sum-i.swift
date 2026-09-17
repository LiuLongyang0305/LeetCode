    // https://leetcode.cn/problems/minimum-operations-to-form-subset-sum-i/
    class Solution {

        private let INF = Int.max / 2
        func minOperations(_ nums: [Int], _ sum: Int) -> Int {
            let M = nums.count
            var memo = [[Int?]](repeating: [Int?](repeating: nil, count: sum + 5), count: M + 5)
            func dfs(_ idx:Int, _ target: Int) -> Int {
                guard target > 0 else {return 0}
                guard idx >= 0 else {return INF}
                if let v = memo[idx][target] {
                    return v
                }
                //不选当前数字
                var sb = dfs(idx - 1, target)
                var x = nums[idx]
                var a = 0
                while x << a <= target {
                    sb = min(sb,a + dfs(idx - 1, target - (x << a)))
                    a += 1
                }
                a = x .bitWidth - x.leadingZeroBitCount
                while a > 0 && x >> a <= target {
                    sb = min(sb,dfs(idx - 1, target - (x >> a)) + a)
                    a -= 1
                }
                memo[idx][target] = sb
                return sb
            }

            let sb = dfs(M - 1, sum)
            return sb >= INF ? -1 : sb
        }
    }
