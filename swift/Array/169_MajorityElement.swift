//https://leetcode.com/problems/majority-element/
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            return nums[0]
        }
        var count = Dictionary<Int,Int>()
        let majorityMinCount = nums.count / 2
        var maxCount = 1
        for num in nums {
            if nil == count[num] {
                count[num] = 1
            } else {
                let currentCount = count[num]!
                if currentCount == majorityMinCount {
                    return num
                }
                count[num] = currentCount + 1
                if count[num]! > maxCount {
                    maxCount = count[num]!
                }
            }
        }
        return -1
    }
}

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var majority = nums[0]
        var count = 0
        for i in 1..<nums.count {
            if count == 0 {
                majority = nums[i]
                count += 1
            } else if nums[i] == majority {
                count += 1
            } else {
            count -= 1
            }
        }
        return majority
    }
}