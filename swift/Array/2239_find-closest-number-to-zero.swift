// https://leetcode.com/problems/find-closest-number-to-zero/
class Solution {
    func findClosestNumber(_ nums: [Int]) -> Int {
        var ans = -1000000
        var curDis = 1000000
        for num in nums {
            let dis = abs(num)
            if dis < curDis {
                curDis = dis
                ans = num
            } else if dis == curDis {
                ans = max(ans, num)
            }
        }
        return ans
    }
}