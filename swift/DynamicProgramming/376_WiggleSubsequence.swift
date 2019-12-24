// https://leetcode.com/problems/wiggle-subsequence/
class Solution {
    typealias WiggleSubsequenceLength = (down: Int, up: Int)
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        let N = nums.count
        guard N > 1 else {
            return nums.count
        }
        var last: WiggleSubsequenceLength = (1,1)
        for index in 1..<N {
            var temp = last
            if nums[index] > nums[index - 1] {
                temp = (last.down,last.down + 1)
            } else if nums[index] < nums[index - 1] {
                temp = (last.up + 1, last.up)
            }
            last = temp
        }
        return max(last.down, last.up)
    }
 }