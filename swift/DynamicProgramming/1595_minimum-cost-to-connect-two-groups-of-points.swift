//https://leetcode.com/problems/minimum-cost-to-connect-two-groups-of-points/
class Solution {
    func connectTwoGroups(_ cost: [[Int]]) -> Int {
        
        let sz1 = cost.count
        let sz2 = cost[0].count
        
        var minSz2 = [Int]()
        for j in 0..<sz2 {
            var t = Int.max
            for i in 0..<sz1 {
                t = min(t, cost[i][j])
            }
            minSz2.append(t)
        }
        
        var memo = [Int:Int]()
        
        func dfs(_ i: Int, _ mask:Int) -> Int {
            let key = (i << 14) | mask
            guard nil == memo[key] else {return memo[key]!}
            var ans = i >= sz1 ? 0 : Int.max
            if i >= sz1 {
                for j in 0..<sz2 {
                    if mask & (1 << j) == 0 {
                        ans += minSz2[j]
                    }
                }
            } else {
                for j in 0..<sz2 {
                    ans = min(ans, cost[i][j] + dfs(i + 1, mask | (1 << j)))
                }
            }
            memo[key] = ans
            return ans
        }
        
        return dfs(0, 0)
    }
}