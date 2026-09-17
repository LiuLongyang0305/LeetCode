// https://leetcode.cn/problems/count-subarrays-with-distant-sums/
class Solution {
    func distantSubarrays(_ nums: [Int], _ goal: Int, _ k: Int) -> Int {
        let M = nums.count
        var preffix = [Int](repeating: 0, count: M + 1)
        for i in 0..<M {
            preffix[i + 1] = preffix[i] + nums[i]
        }
        
        var sortedPreffixPlusGoal = [Int]()
        
        func binarySearchFirstGreaterThanOrEqualTo(_ target: Int) -> Int {
            if sortedPreffixPlusGoal.isEmpty { return 0 }
            var l = 0
            var r = sortedPreffixPlusGoal.count - 1
            while l < r {
                let mid = (l + r) >> 1
                if sortedPreffixPlusGoal[mid] >= target {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            if sortedPreffixPlusGoal[l] < target {
                return sortedPreffixPlusGoal.count
            }
            return l
        }
        
        func binarySearchLastSmallerThanOrEqualTo(_ target: Int) -> Int {
            if sortedPreffixPlusGoal.isEmpty { return -1 }
            var l = 0
            var r = sortedPreffixPlusGoal.count - 1
            while l < r {
                let mid = (l + r + 1) >> 1
                if sortedPreffixPlusGoal[mid] <= target {
                    l = mid
                } else {
                    r = mid - 1
                }
            }
            if sortedPreffixPlusGoal[l] > target {
                return -1
            }
            return l
        }
        
        var answer = 0
        
        for i in 0..<M {
            // 1. 单元素子数组
            if abs(nums[i] - goal) >= k {
                answer += 1
            }
            
            // 2. 长度 >= 2 的子数组
            if i > 0 {
                let target1 = preffix[i + 1] + k
                let target2 = preffix[i + 1] - k
                
                let idx1 = binarySearchFirstGreaterThanOrEqualTo(target1)
                let idx2 = binarySearchLastSmallerThanOrEqualTo(target2)
                
                let countTooLarge = sortedPreffixPlusGoal.count - idx1
                let countTooSmall = idx2 + 1
                
                var total = countTooLarge + countTooSmall
                
                // 🔑 修复：k=0 时减去重复计算的等于 target 的部分
                if k == 0 {
                    let idxFirst = binarySearchFirstGreaterThanOrEqualTo(target1)
                    let idxLast = binarySearchLastSmallerThanOrEqualTo(target1)
                    let countEqual = idxLast - idxFirst + 1
                    total -= countEqual
                }
                
                answer += total
            }
            
            // 3. 插入当前前缀
            let val = preffix[i] + goal
            let insertIdx = binarySearchFirstGreaterThanOrEqualTo(val)
            sortedPreffixPlusGoal.insert(val, at: insertIdx)
        }
        
        return answer
    }
}
