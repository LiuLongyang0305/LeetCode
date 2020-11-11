 // https://leetcode.com/problems/minimum-cost-to-cut-a-stick/
class Solution {
    func minCost(_ n: Int, _ cuts: [Int]) -> Int {
        let sortedCuts = cuts.sorted()
        var memo = [[Int]:Int]()
        func resursion(_ from: Int, _ to: Int, _ curCuts: [Int]) -> Int {
            let N = curCuts.count
            var curMinCost = Int.max
            let key = [from,to]
            guard nil == memo[key] else {
                return memo[key]!
            }
            for idx in 0..<N {
                let cost = to - from
                let leftCost = idx == 0 ? 0 : resursion(from, curCuts[idx], [Int](curCuts[0..<idx]))
                let rightCost = idx == N - 1 ? 0 : resursion(curCuts[idx], to, [Int](curCuts[(idx + 1)...]))
                curMinCost = min(curMinCost,cost + leftCost + rightCost)
            }
            memo[key] = curMinCost
            return curMinCost
        }
        return resursion(0, n, sortedCuts)
    }
}