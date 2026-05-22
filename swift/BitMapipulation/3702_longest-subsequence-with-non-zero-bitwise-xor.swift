
// https://leetcode.cn/problems/longest-subsequence-with-non-zero-bitwise-xor
class Solution {
    func longestSubsequence(_ nums: [Int]) -> Int {
        if Set(nums) == [0] {return 0}

        return  nums.count - (nums.reduce(0, { $0 ^  $1}) == 0 ? 1 : 0)
    }
}
