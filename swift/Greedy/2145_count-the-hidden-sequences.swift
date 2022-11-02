// https://leetcode.com/problems/count-the-hidden-sequences/
class Solution {
    func numberOfArrays(_ differences: [Int], _ lower: Int, _ upper: Int) -> Int {
        let N = differences.count
        var relativeMinEle = 0
        var relativeMaxEle = 0
        var last = 0
        for diff in differences {
            let new = diff + last
            relativeMaxEle = max(relativeMaxEle, new)
            relativeMinEle = min(relativeMinEle, new)
            last = new
        }
        let peekToBottom = relativeMaxEle - relativeMinEle
        return max(upper - lower - peekToBottom + 1, 0)
    }
}