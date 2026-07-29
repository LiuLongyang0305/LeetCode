// https://leetcode.cn/problems/minimum-cost-to-move-between-indices/
class Solution {
    func minCost(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        let n = nums.count
        var sumL = [Int](repeating: 0, count: n) // sumL[i] 等于从 i 移动到 0 的代价和
        var sumR = [Int](repeating: 0, count: n) // sumR[i] 等于从 0 移动到 i 的代价和
        
        // 计算前缀和数组
        for i in 1..<n {
            var cost: Int
            
            // 往左走 i -> i-1
            if i < n - 1 && nums[i] - nums[i - 1] > nums[i + 1] - nums[i] {
                // closest(i) = i+1，只能用方式一往左走
                cost = nums[i] - nums[i - 1]
            } else {
                cost = 1
            }
            sumL[i] = sumL[i - 1] + cost
            
            // 往右走 i-1 -> i
            if i > 1 && nums[i - 1] - nums[i - 2] <= nums[i] - nums[i - 1] {
                // closest(i-1) = i-2，只能用方式一往右走
                cost = nums[i] - nums[i - 1]
            } else {
                cost = 1
            }
            sumR[i] = sumR[i - 1] + cost
        }
        
        // 处理查询
        var ans = [Int](repeating: 0, count: queries.count)
        for i in 0..<queries.count {
            let l = queries[i][0]
            let r = queries[i][1]
            
            if l < r {
                // cost(0 -> r) - cost(0 -> l) = cost(l -> r)
                ans[i] = sumR[r] - sumR[l]
            } else {
                // cost(l -> 0) - cost(r -> 0) = cost(l -> r)
                ans[i] = sumL[l] - sumL[r]
            }
        }
        
        return ans
    }
}
