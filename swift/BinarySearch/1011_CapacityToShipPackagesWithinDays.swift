// https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/
class Solution {
    func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
        var weightsSum = Array<Int>(repeating: 0, count: weights.count + 1)
        for i in 0..<weights.count {
            weightsSum[i + 1] = weightsSum[i]  + weights[i]
        }
        guard D != 1 else {
            return weightsSum.last!
        }
        let maxWeight = weights.max()!
        guard D != weights.count else {
            return maxWeight
        }
        
        func valid(_ capacity: Int) -> Bool {
            var requireDays = 0
            var i = 1
            var start = 0
            while i < weightsSum.count {
                while  i  < weightsSum.count &&  weightsSum[i] - weightsSum[start] <= capacity  {
                    i += 1
                }
                start = i - 1
                requireDays += 1
            }
            return requireDays <= D
        }
        
        var left = maxWeight
        var right = weightsSum.last!
        while left < right {
            let mid = left + (right - left) >> 1
            if valid(mid) {
                right = mid
            } else {
                left = mid + 1
            }
            
        }
        
        return left
    }
}