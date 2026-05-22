  // https://leetcode.cn/problems/find-number-of-ways-to-reach-the-k-th-stair/
    class Solution {
        func waysToReachStair(_ k: Int) -> Int {
            var memo = [String:Int]()
            func dfs(_ cur: Int, _ totalJump: Int, _ isLastDown: Bool) -> Int {
                guard cur <= k + 1 else {
                    return 0
                }
                let key = "\(cur)_\(totalJump)_\(isLastDown ? 1 : 0)"
                if let v = memo[key] {
                    return v
                }
                var sb = cur == k ? 1 : 0
                sb += dfs(cur + (1 << totalJump), totalJump + 1, false)
                if !isLastDown {
                    sb += dfs(cur - 1, totalJump, true)
                }
                memo[key] = sb
                return sb
            }
            return dfs(1,0,false)
        }
    }
