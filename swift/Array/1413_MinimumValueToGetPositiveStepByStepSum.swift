// https://leetcode.com/problems/minimum-value-to-get-positive-step-by-step-sum/
class Solution {
    func minStartValue(_ nums: [Int]) -> Int {
        var startValue = 1
        var sum = 0
        for num in nums {
            sum += num
            if sum < 1 {
                startValue = max(startValue, 1 - sum)
            }
        }
        return startValue
    }
}

