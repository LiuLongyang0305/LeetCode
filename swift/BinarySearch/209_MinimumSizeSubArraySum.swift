//https://leetcode.com/problems/minimum-size-subarray-sum/submissions/
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var totalSum = Array<Int>(repeating: 0, count: nums.count + 1)
        for i in 0..<nums.count {
                totalSum[i + 1] =  totalSum[i] + nums[i]
        }
        guard totalSum.last! >= s else {
            return 0
        }
        
        func valid(_ length: Int) -> Bool {
            var i = 0
            while i <= totalSum.count - length - 1 {
                if totalSum[i + length] - totalSum[i] >= s {
                    return true
                }
                i += 1
            }
            return false
        }
        
        var left =  1
        var right = nums.count
        while left < right {
            let mid = left + (right - left) >> 1
            if  valid(mid)  {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}