//https://leetcode.cn/problems/maximum-number-of-operations-to-move-ones-to-the-end/
class Solution {
    func maxOperations(_ s: String) -> Int {
        var cnt = 0
        var ans = 0
        var last: Character = " "
        for ch in s {
            if ch == "1" {
                cnt += 1
            } else {
                if last == "1" {
                    ans += cnt
                }
            }
            last = ch
        }
        return ans
    }
}