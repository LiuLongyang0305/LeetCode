//https://leetcode.com/problems/pour-water-between-buckets-to-make-water-levels-equal/
class Solution {
    private let limit = pow(10.0, -5.0)
    func equalizeWater(_ buckets: [Int], _ loss: Int) -> Double {
        let bucketsToDouble = buckets.map { Double($0)}
        let total = bucketsToDouble.reduce(0.0) { $0 + $1}
        let lossDouble = Double(loss)
        let remain = 1.0 - lossDouble * 0.01
        let N = Double(buckets.count)

        func check(_ target: Double) -> Bool {
            
            var delta = 0.0
            for temp in bucketsToDouble {
                if temp > target {
                    delta += (temp - target) * remain
                } else {
                    delta -= (target - temp)
                }
            }
            
            return delta >= 0
        }
        
        var left = bucketsToDouble.min()!
        var ans = left
        var right = total / N
        while right - left >= limit {
            let mid = (left + right) / 2.0
            if check(mid) {
                ans = mid
                left = mid
            } else {
                right = mid
            }
        }
        return ans
    }
}