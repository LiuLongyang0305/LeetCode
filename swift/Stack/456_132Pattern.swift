//Test case 93 Time Exceed Limit
//https://leetcode.com/problems/132-pattern/
class Solution {
    typealias Pair = (max: Int, min: Int)
    func find132pattern(_ nums: [Int]) -> Bool {
        var intervals = Array<Pair>()
        var i = 1
        var s = 0
        while i < nums.count {
            if nums[i] <= nums[i - 1] {
                if s < i - 1 {
                    intervals.append((nums[i - 1],nums[s]))
                }
                s = i
            }
            for interval in intervals {
                if nums[i] > interval.min && nums[i] < interval.max {
                    return true
                }
            }
            i += 1
        }
        return false
    }
}