//https://leetcode.com/problems/unique-paths-ii/
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid[0][0] != 1 else {
            return 0
        }
        let row = obstacleGrid.count
        let col = obstacleGrid[0].count
        var ways = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: col), count: row)
        ways[0][0] = 1
        if row > 1 {
            for i in 1..<row {
                if obstacleGrid[i][0] != 1 {
                    ways[i][0] = ways[i - 1][0]
                }
            }
        }
        if  col > 1 {
            for i in 1..<col {
                if obstacleGrid[0][i] != 1 {
                    ways[0][i] = ways[0][i - 1]
                }
            }
        }
        guard row > 1  && col > 1 else {
            return ways[row - 1][col - 1]
        }
        var dx = [0,-1]
        var dy = [-1,0]
        func valid(x: Int,y: Int) -> Bool {
            return x >= 0 && x < row && y >= 0 && y < col && obstacleGrid[x][y] == 0
        }
        
        for i in 1..<row {
            for j in 1..<col {
                if obstacleGrid[i][j] != 1 {
                    for k in 0...1 {
                        let x = i + dx[k]
                        let y = j + dy[k]
                        if  valid(x: x, y: y) {
                            ways[i][j] += ways[x][y]
                        }
                    }
                }
            }
            
        }
        return ways[row -  1][col - 1]
    }
}