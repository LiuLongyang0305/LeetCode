// https://leetcode.com/problems/average-waiting-time/
class Solution {
    func averageWaitingTime(_ customers: [[Int]]) -> Double {
        var waitTime = 0
        var finishTime = -1
        for cus in customers {
            finishTime = max(finishTime, cus[0]) + cus[1]
            waitTime += finishTime - cus[0]
        }
        return Double(waitTime) / Double(customers.count)
    }
}