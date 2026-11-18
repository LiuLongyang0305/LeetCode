    // https://leetcode.cn/problems/find-all-numbers-disappeared-in-an-array-ii/
class Solution {
    func findDisappearedNumbers(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
        guard upper > lower else {
            return upper < lower ? [] : (nums.contains(lower) ? [] : [[lower,lower]])
        } 
        // nums + [lower - 1, upper + 1]
        var arr = nums
        arr.append(lower - 1)
        arr.append(upper + 1)
        
        // 排序
        arr.sort()
        
        // 手写二分查找
        let l = bisectRight(&arr, lower)
        let r = bisectLeft(&arr, upper)
        
        var ans: [[Int]] = []
        
        // 遍历 [l, r]
        for i in l...r {
            if arr[i] - arr[i - 1] > 1 {
                ans.append([arr[i - 1] + 1, arr[i] - 1])
            }
        }
        
        return ans
    }
    
    // 等价于 Python 的 bisect_left
    private func bisectLeft(_ nums: inout [Int], _ target: Int) -> Int {
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
    
    // 等价于 Python 的 bisect_right
    private func bisectRight(_ nums: inout [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return left
    }
}
