//https://leetcode.cn/problems/minimum-removals-to-achieve-target-xor/
class Solution {
    private let INF = 1_000_000_007
    func minRemovals(_ nums: [Int], _ target: Int) -> Int {
        let N = nums.count
        var memo = [String:Int]()
        func dfs(_ idx: Int, _ curTargrt: Int) -> Int {
            guard idx < N else {
                return curTargrt == 0 ? 0: INF
            }
            let key = "\(idx)-\(curTargrt)"
            if let v = memo[key] {return v}
            var sb =  dfs(idx + 1, curTargrt ^ nums[idx])
            sb = min(sb, 1 + dfs(idx + 1, curTargrt))
            memo[key] = sb
            return sb
        }
        let sb = dfs(0, target)
        return sb >= INF ? -1 : sb
    }
}
