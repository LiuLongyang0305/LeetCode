// https://leetcode.com/problems/largest-odd-number-in-string/
class Solution {
    func largestOddNumber(_ num: String) -> String {
        var idx = num.index(before: num.endIndex)
        while true {
            if (num[idx].asciiValue! - 48) % 2 == 1 {
                return String(num[...idx])
            }
            guard idx != num.startIndex else {
                break
            }
            idx = num.index(before: idx)
        }
        return ""
    }
}