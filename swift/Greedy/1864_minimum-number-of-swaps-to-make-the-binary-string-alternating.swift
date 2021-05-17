// https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-binary-string-alternating/
class Solution {
    func minSwaps(_ s: String) -> Int {
        var oneCnt = 0
        var zeroCnt = 0
        for ch in s {
            if ch == "1" {
                oneCnt += 1
            } else {
                zeroCnt += 1
            }
        }
        guard abs(oneCnt - zeroCnt) <= 1 else {
            return -1
        }
        if zeroCnt > oneCnt {
            return helper(s, "0")
        } else if oneCnt > zeroCnt {
            return helper(s, "1")
        } else {
            return min(helper(s, "1"), helper(s, "0"))
        }
    }
    private func helper(_ s: String, _ char: Character) -> Int {
        var swaps = 0
        var targetChar = char
        for ch in s {
            if ch != targetChar  {
                swaps += 1
            }
            targetChar =  targetChar == "0" ? "1" : "0"
        }
        return swaps >> 1
    }
}