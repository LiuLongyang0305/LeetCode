//https://leetcode.com/problems/house-robber/
class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var robbed = nums[0]
        var notRobbed = 0
        for i in 1..<nums.count {
            let currentRobbed = notRobbed  + nums[i]
            let currentNotRobbed = notRobbed < robbed ? robbed : notRobbed
            (robbed,notRobbed) = (currentRobbed,currentNotRobbed)
        }
        return robbed < notRobbed ? notRobbed : robbed
        
    }
}