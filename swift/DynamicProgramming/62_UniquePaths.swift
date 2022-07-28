//https://leetcode.com/problems/unique-paths/

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: n), count: m)

        func dfs(_ x: Int, _ y: Int) -> Int {
            guard x != m - 1 || y != n - 1 else {
                return 1
            }

            guard  !(x < 0 || x >= m || y < 0 || y >= n) else {
                return 0
            }
            if let v = memo[x][y] {
                return v
            }
            var ans = 0
            for (dx,dy) in [(1,0),(0,1)] {
                ans += dfs(x + dx, y + dy)
            }
            memo[x][y] = ans
            return ans
        }
        
        return dfs(0, 0)
    }
}