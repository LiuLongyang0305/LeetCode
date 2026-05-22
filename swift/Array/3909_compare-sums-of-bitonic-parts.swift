    //https://leetcode.cn/problems/compare-sums-of-bitonic-parts/
    class Solution {
        func compareBitonicSums(_ nums: [Int]) -> Int {
            let idx = nums.firstIndex(of: nums.max()!)!
            var sum = 0
            for i in 0..<idx {
                sum += nums[i]
            }
            for i in (idx + 1)..<nums.count{
                sum -= nums[i]
            }
            return sum == 0 ? -1 : (sum > 0 ? 0 : 1)
        }
    }
