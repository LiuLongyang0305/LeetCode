// https://leetcode.com/problems/longest-increasing-path-in-a-matrix/  
class Solution {
    
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        guard !matrix.isEmpty else {
            return 0
        }
        let M = matrix.count
        let N = matrix[0].count
        
        var ans = 1
        var memo = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: N), count: M)
        
        func dfs(_ x: Int, _ y: Int) -> Int {
            guard memo[x][y] == -1 else {
                return memo[x][y]
            }
            let targetVal = matrix[x][y]
            var ret = 1
            
            if x > 0 && matrix[x - 1][y] > targetVal {
                ret = max(ret, 1 + dfs(x - 1, y))
            }
            if y > 0 && matrix[x][y - 1] > targetVal{
                ret = max(ret, 1 + dfs(x, y - 1))
            }
            if x < M - 1 && matrix[x + 1][y] > targetVal {
                ret = max(ret, 1 + dfs(x + 1, y))
            }
            if y < N - 1 && matrix[x][y + 1] > targetVal {
                ret = max(ret, 1 + dfs(x, y + 1))
            }
            memo[x][y] = ret
            ans = max(ans, ret)
            return ret
        }
        
        for r in 0..<M {
            for c in 0..<N  {
                if memo[r][c] == -1 {
                    dfs(r, c)
                }
            }
        }
        return ans
    }
 }