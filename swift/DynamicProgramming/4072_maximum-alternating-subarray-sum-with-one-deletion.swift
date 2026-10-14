    // https://leetcode.cn/problems/maximum-alternating-subarray-sum-with-one-deletion/
    class Solution {
        private let MIN = Int.min / 10
        struct InnerKey: Hashable {
            var idx: Int
            var canBeRemoved: Bool
            var symbol: Bool
        }
        func maxAlternatingSum(_ nums: [Int]) -> Int {
            let N = nums.count
            var memo = [InnerKey:Int]()


            func dfs(_ curIdx: Int, _ canBeRemoved: Bool, _ isNegtive: Bool) -> Int {
                guard curIdx < N else {
                    return MIN
                }
                let key = InnerKey(idx: curIdx, canBeRemoved: canBeRemoved, symbol: isNegtive)
                if let v = memo[key] {return v}
                let x = isNegtive ? -nums[curIdx] : nums[curIdx]
                var sb = MIN
                if !canBeRemoved {
                    sb = max(sb,max(dfs(curIdx + 1, false, !isNegtive),0) + x)
                } else {
                    sb = max(sb,dfs(curIdx + 1, true, !isNegtive) + x, dfs(curIdx + 1, false, isNegtive))
                }
                memo[key] = sb
                return sb
            }


            var ans = Int.min
            for i in 0..<N {
                ans = max(ans, dfs(i, false, false),dfs(i, true, false))
            }
            return ans
        }
    }

