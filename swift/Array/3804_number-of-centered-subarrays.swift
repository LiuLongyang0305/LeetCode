  //https://leetcode.cn/problems/number-of-centered-subarrays/
    class Solution {
        func centeredSubarrays(_ nums: [Int]) -> Int {
            var sb = 0
            var existedNumbers = Set<Int>()
            let N = nums.count
            var sum = 0
            for i in 0..<N {
                sum = 0
                existedNumbers = []
                for j in i..<N {
                    existedNumbers.insert(nums[j])
                    sum += nums[j]
                    if existedNumbers.contains(sum) {
                        sb += 1
                    }
                }
            }
            return sb
        }
    }
