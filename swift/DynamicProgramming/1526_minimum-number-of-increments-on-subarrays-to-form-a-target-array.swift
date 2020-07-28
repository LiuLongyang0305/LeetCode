// https://leetcode.com/problems/minimum-number-of-increments-on-subarrays-to-form-a-target-array/
class Solution {
    func minNumberOperations(_ target: [Int]) -> Int {
        let N = target.count
        var ans = target[0]
        for i in 1..<N {
            ans += max(0, target[i] - target[i - 1])
        }
        return ans
    }
}