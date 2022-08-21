// https://leetcode.com/problems/time-needed-to-rearrange-a-binary-string/
class Solution {
    func secondsToRemoveOccurrences(_ s: String) -> Int {
        var cnt = 0
        var ans = 0
        for ch in s {
            if ch == "0" {cnt += 1}
            else if cnt > 0 {
                ans = max(cnt, ans + 1)
            }
        }
        return ans
    }
}