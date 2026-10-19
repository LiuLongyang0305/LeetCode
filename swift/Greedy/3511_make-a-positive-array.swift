
// https://leetcode.cn/problems/make-a-positive-array/
class Solution {
    func makeArrayPositive(_ nums: [Int]) -> Int {
        var s: [Int] = [0]          // 对应 Python 的 s = [0]
        var ans = 0                 // 操作次数
        var preMx = 0               // 对应 pre_mx
        var j = 0                   // 当前段的起始标记
        
        for i in 1...nums.count {
            let x = nums[i - 1]
            s.append(s.last! + x)   // s.append(s[-1] + x)
            
            if i - j > 2 && s.last! - preMx <= 0 {
                // 需要一次操作，重置当前段
                ans += 1
                j = i
                preMx = 0
                s[s.count - 1] = 0  // 对应 s[-1] = 0
            } else if i - j >= 2 {
                // 更新前面的最大前缀和
                preMx = max(preMx, s[i - 2])
            }
        }
        
        return ans
    }
}
