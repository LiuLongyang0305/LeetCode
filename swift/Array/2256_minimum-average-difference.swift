// https://leetcode.com/problems/minimum-average-difference/
class Solution {
    func minimumAverageDifference(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {return 0}
        let total = nums.reduce(0) {$0 + $1}
        var ans = -1
        var minAveDif = Int.max
        var curSum = 0
        let N = nums.count
        var curDif = 0
        for i in 0..<N {
            curSum += nums[i]
            if N - i - 1 != 0 {
                curDif = abs(curSum / (i + 1) - (total - curSum) / (N - i - 1))
            } else {
                curDif = curSum / (i + 1)
            }
            if curDif < minAveDif {
                minAveDif = curDif
                ans = i
            }
        }


        return ans

    }
}