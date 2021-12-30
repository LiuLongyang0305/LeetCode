// https://leetcode.com/problems/a-number-after-a-double-reversal/
class Solution {
    func isSameAfterReversals(_ num: Int) -> Bool {
        return num == 0 || !(num % 10 == 0)
    }
}