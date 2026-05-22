    // https://leetcode.cn/problems/minimum-increase-to-maximize-special-indices/
    class Solution {
        func minIncrease(_ nums: [Int]) -> Int {
            let N = nums.count

            var cost = [Int](repeating: 0, count: N)
            for  i in stride(from: 1, to: N - 1, by: 1) {
                cost[i] = max(max(nums[i - 1], nums[i + 1]) + 1 - nums[i],0)
            }

            var memo = [String:Int]()

            func dfs(_ idx: Int, _ skip: Bool) -> Int {
                guard idx < N else {return 0}
                let key = "\(idx)-\(skip ? 1 : 0)"
                if let v = memo[key] {return v}
                var sb =  dfs(idx + 2, skip) + cost[idx]
                if skip {
                    sb = min(sb,dfs(idx + 1,false))
                }
                memo[key] = sb
                return sb
            }


            return dfs(1, N & 1 == 0)
        }
    }
