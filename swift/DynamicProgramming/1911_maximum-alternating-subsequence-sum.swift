// https://leetcode.com/problems/maximum-alternating-subsequence-sum/
class Solution {
    func maxAlternatingSum(_ nums: [Int]) -> Int {
        let N = nums.count
        var (odd,even) = (0,nums[0])
        var i = 0
        while i < N {
            (odd,even) = (max(even - nums[i], odd),max(odd + nums[i], even))
            i += 1
        }
        return even
    }
}

