//https://leetcode.cn/problems/maximum-pulse-value-after-one-subarray-rotation/
class Solution {
    func maxValue(_ nums: [Int]) -> Int {
        // 先计算整个 nums 的交替和
        var alterSum = 0
        for i in 0..<nums.count {
            alterSum += i % 2 > 0 ? -nums[i] : nums[i]
        }
        
        let n = nums.count
        var f = [Int](repeating: 0, count: n + 1)
        var mx = 0
        for i in 1..<n {
            let d = nums[i] - nums[i - 1]
            f[i + 1] = max(f[i - 1], 0) + (i % 2 > 0 ? d : -d)
            mx = max(mx, f[i + 1])
        }
        
        return alterSum + mx * 2
    }
}
