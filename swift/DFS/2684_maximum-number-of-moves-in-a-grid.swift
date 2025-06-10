//https://leetcode.com/problems/maximum-number-of-moves-in-a-grid/
class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private let dirs:[Direction] = [(-1,1),(0,1),(1,1)]
    func maxMoves(_ grid: [[Int]]) -> Int {
        var ans = 0
        let M = grid.count
        let N = grid[0].count

        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: N), count: M)

        func dfs(x: Int, y: Int) -> Int {
            if let v = memo[x][y] {
                return v
            }
            var ans = 0
            for (dx,dy) in dirs {
                let nx = x + dx
                let ny = y + dy
                guard nx >= 0 && nx < M && ny >= 0 && ny < N else {continue}
                guard grid[nx][ny] > grid[x][y] else {continue}
                ans = max(ans,1 + dfs(x: nx, y: ny))
            }
            memo[x][y] = ans
            return ans
        }



        for j in 0..<N {
            ans = max(ans,dfs(x: 0, y: j))
        }


        return ans
    }
}
