//https://leetcode.com/problems/count-k-reducible-numbers-less-than-n/
func getDepth(of num: Int) -> Int {
    if num == 0 {return 0}
    if num == 1 {return 1}
    return 1 + getDepth(of: num.nonzeroBitCount)
}
let depths = (0...801).map { getDepth(of: $0)}
class Solution {
    private let MOD = 1_000_000_007
    private  struct KeyNode: Hashable {
        var pos: Int
        var isLessThan: Bool
        var remainDepth: Int
    }
    func countKReducibleNumbers(_ s: String, _ k: Int) -> Int {
        let nums = s.map { $0 == "1" ? 1 : 0}
        let M = s.count
        var memo = [KeyNode:Int]()
        func dfs(_ pos: Int, _ isLessThan: Bool, _ remainDepth: Int) -> Int {
            guard pos < M else {
                return (remainDepth == 0 && isLessThan) ? 1 : 0
            }
            guard remainDepth >= 0 else {return 0}
            let key = KeyNode(pos: pos, isLessThan: isLessThan, remainDepth: remainDepth)
            if let sb = memo[key] {
                return sb
            }
            var sb = 0
            sb += dfs(pos + 1, isLessThan || nums[pos] == 1, remainDepth)
            sb %= MOD
            if isLessThan || nums[pos] == 1 {
                sb += dfs(pos + 1, isLessThan, remainDepth - 1)
                sb %= MOD
            }
            memo[key] = sb
            return sb
        }

        var sb = 0
        for i in 1...M {
            if depths[i] <= k {
                sb += dfs(0, false, i)
                sb %= MOD
            }
        }
        return sb
    }
}
