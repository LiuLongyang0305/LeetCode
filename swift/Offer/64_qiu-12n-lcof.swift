// https://leetcode-cn.com/problems/qiu-12n-lcof/
class Solution {
    var ans = 0
    func sumNums(_ n: Int) -> Int {
        var flag = n > 1 && (sumNums(n - 1) > 0)
        ans += n
        return ans
    }
}