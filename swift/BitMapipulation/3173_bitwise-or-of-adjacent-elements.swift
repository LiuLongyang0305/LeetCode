    // https://leetcode.cn/problems/bitwise-or-of-adjacent-elements/
    class Solution {
        func orArray(_ nums: [Int]) -> [Int] {
            var sb = [Int]()
            for i in 0..<(nums.count - 1) {
                sb.append(nums[i] | nums[i + 1])
            }
            return sb
        }
    }
