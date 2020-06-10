// https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof/
class Solution {
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        guard n > 1 else {
            return 0
        }
        var ans = 0
        for i in 2...n {
            ans = (m + ans) % i
        }
        return ans
    }
}