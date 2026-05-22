//https://leetcode.cn/problems/minimum-moves-to-equal-array-elements-iii/
class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        var sb = 0
        let maxVal = nums.max()!
        for num in nums {
            sb += maxVal - num
        }
        return sb
    }
}
