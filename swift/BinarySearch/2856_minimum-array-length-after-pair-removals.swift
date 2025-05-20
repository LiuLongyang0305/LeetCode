//https://leetcode.com/problems/minimum-array-length-after-pair-removals
class Solution {
    func minLengthAfterRemovals(_ nums: [Int]) -> Int {
        func check(mid: Int) -> Bool {
            var i = 0
            var j = mid
            while i < mid && j < nums.count {
                while  j < nums.count && nums[j] == nums[i] {
                    j += 1
                }
                if j >= nums.count {
                    break
                }
                i += 1
                j += 1
            }
            return  i >= mid
        }


        var left = 0
        var right = nums.count / 2
        while left < right {
            let mid = (left + right + 1) >> 1
            if check(mid: mid) {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return nums.count - left * 2
    }
}