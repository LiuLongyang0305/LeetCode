// https://leetcode.com/problems/trionic-array-i/
class Solution {
    func isTrionic(_ nums: [Int]) -> Bool {

        // first segment
        var i = 1
        while i < nums.count && nums[i] > nums[i - 1]  {
            i += 1
        } 
        guard i > 1 else {return false}

        //last segemnt
        var j = nums.count - 2
        while j >= 0 && nums[j] < nums[j + 1] {
            j -= 1
        }
        guard j <  nums.count - 2 else {return false}
        guard i < j + 2 else {return false}

        // second segment
        for k in stride(from: i - 1, through: j, by: 1) {
            if nums[k + 1] >= nums[k] {
                return false
            }
        }
        return true
    }
}
