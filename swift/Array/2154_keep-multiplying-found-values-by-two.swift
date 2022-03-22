// https://leetcode.com/problems/keep-multiplying-found-values-by-two/
class Solution {
    func findFinalValue(_ nums: [Int], _ original: Int) -> Int {
        var ori = original
        while let _ = nums.firstIndex(of: ori) {
            ori *= 2
        }
        return ori
    }
}