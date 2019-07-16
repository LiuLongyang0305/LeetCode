//https://leetcode.com/problems/island-perimeter/
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var perimeter = 0
        let rowSize = grid.count
        let colSize = grid[0].count
        func getPerimeter(x: Int,y : Int) -> Int {
            var ans = 4
            if x - 1 >= 0 && grid[x - 1][y] == 1 {
                ans -= 1
            }
            if  x + 1 < rowSize && grid[x  + 1][y] == 1 {
                ans -= 1
            }
            if y - 1 >= 0 && grid[x][y  - 1] == 1 {
                ans -= 1
            }
            if y + 1 < colSize && grid[x][y + 1] == 1 {
                ans -= 1
            }
            return ans
        }
        for i in 0..<rowSize {
            for j in 0..<colSize {
                if grid[i][j] == 1 {
                    perimeter += getPerimeter(x: i, y: j)
                }
            }
        }
        return perimeter
    }
}

var  islands = [[1,0]]
Solution().islandPerimeter(islands)
