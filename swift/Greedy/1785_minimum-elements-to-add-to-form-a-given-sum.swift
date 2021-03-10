// https://leetcode.com/problems/minimum-elements-to-add-to-form-a-given-sum/
class Solution {
    func minElements(_ nums: [Int], _ limit: Int, _ goal: Int) -> Int {
        return Int(ceil(Double(abs(nums.reduce(0, {$0 + $1}) - goal)) / Double(limit) ))
    }
}

