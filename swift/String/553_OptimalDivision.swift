//https://leetcode.com/problems/optimal-division/
class Solution {
    func optimalDivision(_ nums: [Int]) -> String {
        guard nums.count >  2 else {
            if nums.count == 1 {
                return "\(nums[0])"
            } else {
                return "\(nums[0])/\(nums[1])"
            }
        }
        var ans = "\(nums[0])/("
        for i in 1..<nums.count {
            ans += "\(nums[i])/"
        }
        ans.removeLast()
        ans.append(")")
        return  ans
    }
}