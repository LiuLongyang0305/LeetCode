// https://leetcode.cn/problems/maximum-number-of-operations-with-the-same-score-ii
class Solution {
    func maxOperations(_ nums: [Int]) -> Int {

        var memo = [String:Int]()

        func dfs(_ left: Int, _ right: Int, _ sum: Int) -> Int {
            if left >= right {
                return 0
            }

            let key = "\(left)_\(right)_\(sum)"
            if let v = memo[key] {
                return v
            }
            var ans = 0

            if nums[left] + nums[right] == sum {
                ans = max(ans,1 + dfs(left + 1, right - 1, sum))
            }
            if nums[left] + nums[left + 1] == sum {
                ans = max(ans,1 + dfs(left + 2, right, sum))
            }
            if nums[right] + nums[right - 1] == sum {
                ans = max(ans,1 + dfs(left, right  - 2, sum))
            }
            memo[key] = ans
            return ans
        }

        let N = nums.count

    return max(dfs(0,N - 1,nums[0] + nums[1]),dfs(0,N - 1,nums[0] + nums[N - 1]),dfs(0,N - 1,nums[N - 1] + nums[N - 2]))
    }
}