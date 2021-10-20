// https://leetcode.com/problems/count-number-of-maximum-bitwise-or-subsets/
class Solution {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        var maxVal = Int.min
        var cnt = 0
        let N = nums.count
        for i in 1..<(1 << N) {
            
            var t = 0
            
            for bit in 0..<N {
                if i & (1 << bit) != 0 {
                    t |= nums[bit]
                }
            }
            if t > maxVal {
                maxVal = t
                cnt = 1
            } else if t == maxVal {
                cnt += 1
            }
        }
        return cnt
    }
}