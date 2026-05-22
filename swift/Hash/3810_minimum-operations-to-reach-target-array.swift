    //https://leetcode.cn/problems/minimum-operations-to-reach-target-array/
    class Solution {
        func minOperations(_ nums: [Int], _ target: [Int]) -> Int {
            var set = Set<Int>()
            for i in 0..<nums.count {
                if nums[i] != target[i] {
                    set.insert(nums[i])
                }
            }
            return set.count
        }
    }
