// https://leetcode.com/problems/maximum-score-after-splitting-a-string/
class Solution {
    func maxScore(_ s: String) -> Int {
        var cntZero = 0
        var cntOne = 0
        for ch in s {
            if ch == "1" {
                cntOne += 1
            } else {
                cntZero += 1
            }
        }
        var tempCntZero = 0
        var tempCntOne = 0
        var ans = 0
        for ch in s {
            if tempCntOne + tempCntZero > 0 {
            ans = max(ans, tempCntZero + cntOne - tempCntOne)
            }
            if ch == "1" {
                tempCntOne += 1
            } else {
                tempCntZero += 1
            }
        }
        return ans
    }
}