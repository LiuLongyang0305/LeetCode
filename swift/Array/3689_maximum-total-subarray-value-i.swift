//https://leetcode.com/problems/maximum-total-subarray-value-i/
class Solution {
    func maxTotalValue(_ nums: [Int], _ k: Int) -> Int {
        return ((nums.max() ?? 0)  - (nums.min() ?? 0)) * k
    }
}
