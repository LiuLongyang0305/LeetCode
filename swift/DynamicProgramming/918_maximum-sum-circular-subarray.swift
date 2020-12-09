// https://leetcode.com/problems/maximum-sum-circular-subarray/
class Solution {
    func maxSubarraySumCircular(_ A: [Int]) -> Int {
        var total = 0
        var maxSum = A[0]
        var curMax = 0
        var minSum = A[0]
        var curMin = 0
        for num in A {
            curMax = max(curMax + num, num)
            maxSum = max(maxSum, curMax)
            curMin = min(curMin + num, num)
            minSum = min(minSum, curMin)
            total += num
        }
        return maxSum > 0 ? max(maxSum, total - minSum) : maxSum
    }
   
}