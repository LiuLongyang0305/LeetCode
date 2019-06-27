//https://leetcode.com/problems/max-consecutive-ones/
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var maxCount = 0
        let parts =   nums.split(separator: 0)
        for part in parts {
            if maxCount < part.count {
                maxCount = part.count
            }
        }
        return maxCount
    }
}

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var i = 0
        while  i < nums.count  && nums[i] == 0  {
            i += 1
        }
        if i == nums.count {
            return 0
        }
        var countOne = 0
        var maxCount = 0
        while i < nums.count {
            if nums[i] == 1 {
                countOne += 1
            } else {
                if countOne > maxCount {
                    maxCount = countOne
                }
                countOne = 0
            }
            i += 1
        }

        return  max(countOne, maxCount)
    }
}