//https://leetcode.com/problems/surface-area-of-3d-shapes/
class Solution {
    typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func surfaceArea(_ grid: [[Int]]) -> Int {
        var ans = 0
        let row = grid.count
        let col = grid[0].count
        func valid (_ x:Int, _ y: Int) -> Bool {
            return x >= 0 &&  x < row && y >= 0 && y < col && grid[x][y] != 0
        }
        for i in 0..<row {
            for j in 0..<col{
                if grid[i][j] != 0 {
                    ans += 4 * grid[i][j] + 2
                }
                for dir in directions {
                    let x1 = i + dir.dx
                    let y1 = j + dir.dy
                    if valid(x1, y1) {
                        ans -= min(grid[i][j], grid[x1][y1])
                    }
                }
            }
        }
        return ans
    }
}
Solution().surfaceArea([[1,0],[0,2]])
