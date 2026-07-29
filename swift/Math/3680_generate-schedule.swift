// https://leetcode.cn/problems/generate-schedule/
class Solution {
    func generateSchedule(_ n: Int) -> [[Int]] {
        // 处理 n < 5 的情况，返回空数组
        guard n >= 5 else {
            return []
        }
        
        // 创建结果数组，容量为 n*(n-1)
        var ans: [[Int]] = Array(repeating: [], count: n * (n - 1))
        var idx = 0
        
        // 处理 d = 2, 3, ..., n-2
        for d in 2..<(n - 1) {
            for i in 0..<n {
                ans[idx] = [i, (i + d) % n]
                idx += 1
            }
        }
        
        // 交错排列 d = 1 与 d = n-1（或者说 d = -1）
        for i in 0..<n {
            ans[idx] = [i, (i + 1) % n]
            idx += 1
            ans[idx] = [(i + n - 1) % n, (i + n - 2) % n]
            idx += 1
        }
        
        return ans
    }
}
