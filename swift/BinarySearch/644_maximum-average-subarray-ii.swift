//https://leetcode.com/problems/maximum-average-subarray-ii/
class Solution {
    private let err = 1e-5
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        
        let N = nums.count
        let nums2Double = nums.map {Double($0)}
        
        guard N != k else {
            return nums2Double.reduce(0) {$0 + $1} / Double(N)
        }
        
        
        func check(_ maxAverage: Double) -> Bool {
            var sum = 0.0
            var pre = 0.0
            var minSum = 0.0
            for i in 0..<k {
                sum += nums2Double[i] - maxAverage
            }
            guard sum < 0 else {
                return true
            }
            for i in k..<N {
                sum += nums2Double[i] - maxAverage
                pre += nums2Double[i - k] - maxAverage
                minSum = min(pre, minSum)
                guard sum < minSum else {
                    return true
                }
            }
            return false
        }
        
        var low = nums2Double.min()!
        var high = nums2Double.max()!
        while high - low > err {
            let mid = (low + high) / 2.0
            if check(mid) {
                low = mid
            } else {
                high = mid
            }
        }
        return low
    }
}
