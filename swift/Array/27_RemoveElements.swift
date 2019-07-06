//https://leetcode.com/problems/remove-element/
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        while i < nums.count {
            if nums[i] == val {
                nums.remove(at: i)
            } else {
                i += 1
            }
        }
        return nums.count
    }
}