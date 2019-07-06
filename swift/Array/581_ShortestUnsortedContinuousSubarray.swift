//https://leetcode.com/problems/shortest-unsorted-continuous-subarray/
class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        guard nums.count != 2 else {
            return  nums[0] <= nums[1] ? 0 : 2
        }
        var numbersCopy = nums
        numbersCopy.sort()
        var i = 0
        while i < numbersCopy.count {
            if !(numbersCopy[i] == nums[i]) {
                break
            }
            i += 1
        }
        
        if i == numbersCopy.count {
            return 0
        }
        
        var j = numbersCopy.count - 1
        while j >= 0 {
            if !(numbersCopy[j] == nums[j]) {
                break
            }
            j -= 1
        }
        return j - i + 1
    }
}