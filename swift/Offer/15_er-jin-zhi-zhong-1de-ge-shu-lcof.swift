// https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof/
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var ans = 0
        var temp = n
        while temp > 0 {
            ans += 1
            temp = temp & (temp - 1)
        }
        return ans
    }
}