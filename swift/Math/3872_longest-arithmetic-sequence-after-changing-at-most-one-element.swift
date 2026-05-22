// https://leetcode.cn/problems/longest-arithmetic-sequence-after-changing-at-most-one-element/
class Solution {
    func longestArithmetic(_ nums: [Int]) -> Int {
        let n = nums.count
        // 边界条件：长度≤3时，改1个元素必成等差
        if n <= 3 {
            return n
        }
        
        // 构建差分数组：diff[0]未使用，diff[i] = nums[i] - nums[i-1]（i≥1）
        var diff = [Int](repeating: 0, count: n)
        for i in 1..<n {
            diff[i] = nums[i] - nums[i-1]
        }
        
        var maxDiffLen = 0  // 差分数组中最长有效段的长度
        var i = 1           // 从差分数组第一个有效位置（索引1）开始遍历
        
        while i < n {
            var j = i
            // 1. 找连续相等差分的结束位置（j是第一个不等的位置）
            while j < n && diff[i] == diff[j] {
                j += 1
            }
            let continuousLen = j - i  // 当前连续差分的长度
            
            // 2. 基础情况：修改边缘1元素，最长段为「连续长度+1」（不超过数组上限）
            var currentMax = min(continuousLen + 1, n - 1)
            
            // 3. 尝试向右合并：修改j右侧1元素，衔接左右相同差分
            if j + 1 < n {
                let sum = diff[j] + diff[j+1]
                if sum == 2 * diff[i] {  // 右侧两差分的平均值等于当前差分
                    var k = j + 2
                    // 继续向右探索相同差分的延续
                    while k < n && diff[k] == diff[i] {
                        k += 1
                    }
                    // 合并后的总差分长度：k - i
                    currentMax = max(currentMax, k - i)
                }
            }
            
            // 4. 尝试向左合并：修改i左侧1元素，衔接左右相同差分
            if i >= 3 {
                let sum = diff[i-1] + diff[i-2]
                if sum == 2 * diff[i] {  // 左侧两差分的平均值等于当前差分
                    currentMax = max(currentMax, continuousLen + 2)
                }
            }
            
            // 5. 更新全局最大差分长度
            maxDiffLen = max(maxDiffLen, currentMax)
            // 跳转到下一段不同差分
            i = j
        }
        
        // 差分长度转原数组长度（差分长度L → 原数组长度L+1）
        return maxDiffLen + 1
    }
}
