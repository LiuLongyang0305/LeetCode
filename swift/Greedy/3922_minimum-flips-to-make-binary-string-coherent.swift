//https://leetcode.cn/problems/minimum-flips-to-make-binary-string-coherent/
class Solution {
    func minFlips(_ s: String) -> Int {
        let n = s.count
        // 统计 '0' 的数量
        let c0 = s.filter { $0 == "0" }.count
        // 初始计算 c1（需要翻转的 '1' 的数量，预留一个不翻转）
        var c1 = n - c0 - 1
        
        // 如果首尾都是 '1'，则可以多保留一个 '1' 不翻转
        if s.hasPrefix("1") && s.hasSuffix("1") {
            c1 -= 1
        }
        
        // 返回两种情况的最小值：全翻成 '1' 或 保留尽可能多的 '1'
        return min(c0, max(c1, 0))
    }
}
