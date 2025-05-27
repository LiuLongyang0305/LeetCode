//https://leetcode.cn/problems/separate-black-and-white-balls/
class Solution {
    func minimumSteps(_ s: String) -> Int {
        var oneCnt = 0
        var ans = 0
        for ch in s {
            if ch == "0" {
                ans += oneCnt
            } else {
                oneCnt += 1
            }
        }
        return ans
    }
}
