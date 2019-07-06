//https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var i = 0
        var j = 1
        var count = 0
        while j < nums.count {
            if nums[j] != nums[i] {
                count = 0
                i += 1
                j += 1
            } else {
                count += 1
                if count > 1 {
                    nums.remove(at: j)
                } else {
                    j += 1
                    i += 1
                }
            }
        }
        return nums.count
    }
}