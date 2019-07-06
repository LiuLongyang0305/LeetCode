//https://leetcode.com/problems/largest-number-at-least-twice-of-others/
class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        let maxEle = nums.max()!
        var maxIndex = -1
        for i in 0..<nums.count {
            if maxEle == nums[i] {
                maxIndex = i
            } else {
                if 2 * nums[i] > maxEle {
                    return -1
                }
            }
        }
        return maxIndex
    }
}