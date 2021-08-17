// https://leetcode-cn.com/problems/fpTFWP/
class Solution {
    private typealias Position = (x:Int,y:Int)
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        guard !matrix.isEmpty else {
            return 0
        }
        let M = matrix.count
        let N = matrix[0].count
        var memo = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: N), count: M)
        
        
        func dfs(_ x:Int, _ y: Int) -> Int {
            guard memo[x][y] == -1 else {
                return memo[x][y]
            }
            var ret = 1
            let targeVal = matrix[x][y]
            for (dx,dy) in directions {
                let nx = x + dx
                let ny = y + dy
                guard nx >= 0 && nx < M && ny >= 0 && ny < N && matrix[nx][ny] > targeVal else {
                    continue
                }
                ret = max(ret, 1 + dfs(nx, ny))
            }
            memo[x][y] = ret
            return ret
        }
        
        var ans = 1
        for r in 0..<M {
            for c in 0..<N {
                if memo[r][c] == -1 {
                    ans = max(ans, dfs(r, c))
                }
            }
        }
        return ans
    }
}