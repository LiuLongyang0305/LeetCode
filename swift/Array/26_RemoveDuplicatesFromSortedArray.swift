//https://leetcode.com/problems/remove-duplicates-from-sorted-array/submissions/
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var i = 0
        var j = 1
        while j < nums.count {
            if i == 0 {
                while j < nums.count && nums[j] != nums[i] {
                    i += 1
                    j += 1
                }
            }
            
            while j < nums.count && nums[j] == nums[i]  {
                j += 1
            }
            
            if j != nums.count {
                i += 1
                nums[i] = nums[j]
                j += 1
            }
        }
        
        return i + 1
    }
}
