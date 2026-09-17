// https://leetcode.cn/problems/minimize-or-of-remaining-elements-using-operations/
class Solution {
    func minOrAfterOperations(_ nums: [Int], _ k: Int) -> Int {
        var ans = 0          // 最终最小可能的总 OR
        var mask = 0         // 当前只关注某些高位时的掩码
        
        // 从最高位开始往低位贪心（题目数值通常 < 2^30，故 29→0）
        for b in (0...29).reversed() {
            mask |= (1 << b) // 先把第 b 位加入“需要考察”的掩码
            
            var cnt = 0      // 统计在 mask 下，为了让每段 AND 不为 0 所需要的合并次数
            var and = -1     // -1 的二进制全 1，作为段起始的 AND 初值
            
            for x in nums {
                // 只关心 mask 中的位；把 x 合并进当前段
                and &= (x & mask)
                
                if and != 0 {
                    // 当前段在 mask 下 AND 仍非 0，说明还需要继续合并/计一次
                    cnt += 1
                } else {
                    // 当前段已经把 mask 中关注的位全部 AND 成 0
                    // 重新开始下一段
                    and = -1
                }
            }
            
            // 如果需要的操作次数超过 k，说明这一高位靠 k 次操作消不掉
            // 那么答案的这一位必须是 1
            if cnt > k {
                ans |= (1 << b)
                // 后面不再强制要求这一位为 0，从 mask 中移除
                mask ^= (1 << b)
            }
            // 如果 cnt <= k，说明这一位可以消成 0，不进 ans，mask 保留继续看更低位
        }
        
        return ans
    }
}
