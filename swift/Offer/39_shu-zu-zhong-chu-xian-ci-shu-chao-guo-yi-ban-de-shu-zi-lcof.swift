// https://leetcode-cn.com/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof/
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var ans = Int.max
        var cnt = 0
        for num in nums {
            if cnt == 0 {
                cnt += 1
                ans = num
            } else {
                cnt += (num == ans ? 1 : -1)
            }
        }
        return ans
    }
}