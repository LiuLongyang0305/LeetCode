//https://leetcode.com/problems/move-zeroes/
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var zeroCount = 0
        while i < nums.count - zeroCount {
            if nums[i] == 0 {
                zeroCount += 1
                nums.append(0)
                nums.remove(at: i)
            } else {
                i += 1
            }
        }
    }
}