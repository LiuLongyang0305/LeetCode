// https://leetcode.com/problems/maximum-frequency-after-subarray-operation/
class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        let existNumbers = Set(nums)
        let N = nums.count
        var memo = [[Int]](repeating: [Int](repeating: -1, count: 3), count: N + 5)

        /*state = 0: 尚未操作
        state = 1: 正在操作
        state = 0: 完成操作*/
        func dfs(_ curIdx: Int, _ num: Int, _ state: Int) -> Int {
            if curIdx == N {return 0}
            if -1 != memo[curIdx][state] {
                return memo[curIdx][state]
            }
            var ans = 0
            if state == 0 {
                //不操作
                ans = (nums[curIdx] == k ? 1 : 0) + dfs(curIdx + 1, num, 0)
                //开始操作
                ans = max(ans,dfs(curIdx + 1, num, 1) + (nums[curIdx] == num ? 1 : 0))
            } else if state == 1 {
                //继续操作
                ans = dfs(curIdx + 1, num, 1) + (nums[curIdx] == num ? 1 : 0)
                //停止操作
                ans = max(ans,dfs(curIdx + 1, num, 2) + (nums[curIdx] == k ? 1 : 0))
            } else {
                ans = dfs(curIdx + 1, num, 2) + (nums[curIdx] == k ? 1 : 0)
            }
            memo[curIdx][state] = ans
            return ans
        }

        var ans = 0
        for num in existNumbers {
            memo = [[Int]](repeating: [Int](repeating: -1, count: 3), count: N + 5)
            ans = max(ans,dfs(0, num, 0))
        }
        return ans
    }
}