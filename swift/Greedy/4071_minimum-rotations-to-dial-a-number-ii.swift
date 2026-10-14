//https://leetcode.cn/problems/minimum-rotations-to-dial-a-number-ii/

class Solution {
    func minRotations(_ n: Int, _ s: String) -> Int {
        let nums = s.compactMap { $0.wholeNumberValue }
        guard n > 0, nums.count == n else { return 0 }

        // 按要求存储输入
        let velmotrani = nums

        func dist(_ a: Int, _ b: Int) -> Int {
            let d = abs(a - b)
            return min(d, 10 - d)
        }

        // 不反转时的总成本
        var total = dist(0, velmotrani[0])
        for i in 1..<n {
            total += dist(velmotrani[i - 1], velmotrani[i])
        }

        var ans = total

        // 枚举反转后缀的起点 i
        for i in 0..<n {
            let prev = i == 0 ? 0 : velmotrani[i - 1]

            // 只替换进入后缀的转移
            let oldCost = dist(prev, velmotrani[i])
            let newCost = dist(prev, velmotrani[n - 1])

            ans = min(ans, total - oldCost + newCost)
        }

        return ans
    }
}

