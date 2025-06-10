//https://leetcode.com/problems/paint-house-iv

class Solution {
    func minCost(_ n: Int, _ cost: [[Int]]) -> Int {
        let N = n / 2

        var memo = [[[Int?]]](repeating: [[Int?]](repeating: [Int?](repeating: nil, count: 3), count: 3), count: n / 2)
        func dfs( _ left: Int, _ preI: Int, _ preJ: Int) -> Int {

            guard left < N else {return 0}
            if left != 0 {
                if let v = memo[left][preI][preJ] {
                    return v
                }
            }
            let right = n - 1 - left
            var ans = Int.max / 2
            for i in 0...2 {
                guard i != preI else {continue}
                for j in 0...2 {
                    guard j != preJ else {continue}
                    guard j != i else {continue}
                    ans = min(ans,cost[left][i] + cost[right][j] + dfs(left + 1, i, j))
                }
            }
            if left != 0 {
                memo[left][preI][preJ]  = ans
            }
            return ans
        }

        return dfs(0,-1,-1)
    }
}
