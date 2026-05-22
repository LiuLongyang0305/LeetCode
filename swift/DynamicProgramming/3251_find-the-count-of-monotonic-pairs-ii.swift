//https://leetcode.com/problems/find-the-count-of-monotonic-pairs-ii/
class Solution {
    let MOD = 1_000_000_007
    
    func countOfPairs(_ nums: [Int]) -> Int {
        let N = nums.count
        guard N > 0 else { return 0 }
        
        let maxVal = nums.max() ?? 0
        // dp[pos][x] 表示在位置 pos 选择数字 x 的方案数
        var dp = [[Int]](repeating: [Int](repeating: 0, count: maxVal + 2), count: N)
        
        // 初始化最后一层
        for x in 0...nums[N-1] {
            dp[N-1][x] = 1
        }
        
        // 从倒数第二层开始向上计算
        for i in stride(from: N-2, through: 0, by: -1) {
            // 构建下一层的前缀和
            var prefix = [Int](repeating: 0, count: maxVal + 2)
            prefix[0] = dp[i+1][0]
            for j in 1...maxVal {
                prefix[j] = (prefix[j-1] + dp[i+1][j]) % MOD
            }
            
            let delta = nums[i+1] - nums[i]
            for x in 0...nums[i] {
                // 计算合法 nx 的范围
                let low = max(x, x + delta)
                let high = nums[i+1]
                
                if low <= high {
                    let sum = (prefix[high] - (low > 0 ? prefix[low-1] : 0)) % MOD
                    dp[i][x] = (sum + MOD) % MOD
                }
            }
        }
        
        // 计算最终答案：第一层所有选择的方案数之和
        var ans = 0
        for x in 0...nums[0] {
            ans = (ans + dp[0][x]) % MOD
        }
        return ans
    }
}
