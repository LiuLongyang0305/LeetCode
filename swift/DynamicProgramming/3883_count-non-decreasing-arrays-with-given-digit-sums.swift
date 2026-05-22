    //https://leetcode.cn/problems/count-non-decreasing-arrays-with-given-digit-sums/
    import Foundation

class Solution {
    func countArrays(_ digitSum: [Int]) -> Int {
        let MOD = 1_000_000_007
        let n = digitSum.count
        
        // 1. 预处理：按数位和分组，每组数字已排序
        var digitSumToNumbers: [Int: [Int]] = [:]
        
        for num in 0...5000 {
            var sum = 0
            var tmp = num
            while tmp > 0 {
                sum += tmp % 10
                tmp /= 10
            }
            digitSumToNumbers[sum, default: []].append(num)
        }
        
        // 2. 检查是否有 digitSum[i] 没有对应的数字
        for sum in digitSum {
            if digitSumToNumbers[sum] == nil {
                return 0
            }
        }
        
        // 3. 获取每个位置对应的数字数组
        var positionNumbers: [[Int]] = []
        for i in 0..<n {
            // 由于我们之前已经确认了每个 digitSum[i] 都有对应的数组，这里可以安全解包
            positionNumbers.append(digitSumToNumbers[digitSum[i]]!)
        }
        
        // 4. 记忆化数组
        var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: 1000), count: 1000)
        
        // 5. 记忆化搜索函数
        func dfs(_ i: Int, _ j: Int) -> Int {
            // 如果已经计算过，直接返回结果
            if let cached = memo[i][j] {
                return cached
            }
            
            var res = 0
            
            if i == n - 1 {
                // 如果是最后一个位置，返回从 j 开始到末尾的数字个数
                res = positionNumbers[i].count - j
            } else {
                // 情况1：在当前数位和对应的数字中，选择下一个数字（j+1）
                if j + 1 < positionNumbers[i].count {
                    res = (res + dfs(i, j + 1)) % MOD
                }
                
                // 如果 j 已经超出当前数字列表的范围，直接返回当前结果
                if j >= positionNumbers[i].count {
                    memo[i][j] = res
                    return res
                }
                
                // 情况2：进位到下一个位置
                let currentNum = positionNumbers[i][j]
                let nextPositionNumbers = positionNumbers[i + 1]
                
                // 在下一个位置的数字列表中，找到第一个大于等于 currentNum 的位置
                // 由于数字列表是有序的，我们可以使用二分查找
                let nextIndex = binarySearchFirstGreaterOrEqual(nextPositionNumbers, currentNum)
                
                if nextIndex < nextPositionNumbers.count {
                    res = (res + dfs(i + 1, nextIndex)) % MOD
                }
                // 如果 nextIndex 等于 nextPositionNumbers.count，说明没有合适的数字，不增加结果
            }
            
            // 缓存结果
            memo[i][j] = res
            return res
        }
        
        // 6. 调用 DFS
        let result = dfs(0, 0)
        return result
    }
    
    // 二分查找：在有序数组中找到第一个大于等于 target 的元素的索引
    private func binarySearchFirstGreaterOrEqual(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return left
    }
}
