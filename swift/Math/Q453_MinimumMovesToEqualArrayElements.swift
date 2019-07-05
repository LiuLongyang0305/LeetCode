//https://leetcode.com/problems/minimum-moves-to-equal-array-elements/
class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        var ans = 0
        let minEle = nums.min()!
        for ele in nums {
            ans += (ele - minEle)
        }
        return ans
    }
}