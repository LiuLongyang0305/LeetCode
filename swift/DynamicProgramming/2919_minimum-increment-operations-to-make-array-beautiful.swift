// https://leetcode.com/problems/minimum-increment-operations-to-make-array-beautiful/
class Solution {
    func minIncrementOperations(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        var memo = [Int:Int]()
//        bit1 == 1 : 前头第二个满足
//        bit0 == 1: 上一个满足
        func dfs(_ curIdx: Int,_ state: Int) -> Int {

            guard curIdx < N else {return 0}
            let key = (curIdx << 10) | state
            if let v = memo[key] {
                return v
            }
            var ans = Int.max
            //已经满足
            if nums[curIdx] >= k {
                ans = min(ans,dfs(curIdx + 1, ((state & 11) << 1) | 1))
            } else {
                //使之满足
                ans = min(ans, k - nums[curIdx] + dfs(curIdx + 1, ((state & 1) << 1) | 1))
                //可以不满足
                if state > 0 {
                    ans = min(ans, dfs(curIdx + 1, (state & 1) << 1))
                }

            }

            memo[key] = ans
            return ans
        }


        var ans = Int.max
        for state in 0...3 {
            ans = min(ans,dfs(0, state))
        }
        return ans
    }
}
