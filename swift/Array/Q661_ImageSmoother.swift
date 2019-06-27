//https://leetcode.com/problems/image-smoother/
class Solution {
    var rowLimit = 0
    var colLimit = 0
    var result = [[Int]]()
    var data = [[Int]]()
    func imageSmoother(_ M: [[Int]]) -> [[Int]] {
        self.colLimit = M[0].count
        self.rowLimit = M.count
        self.result =  Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: colLimit), count: rowLimit)
        self.data = M
        for i in 0..<rowLimit {
            for j in 0..<colLimit {
                getAverage(x: i, y: j)
            }
        }
        return result
    }
    
    private func getAverage(x: Int, y: Int)  {
        var sum = 0
        
        let leftBoundary = y - 1 < 0 ? 0 : (y - 1)
        
        let rightBoundary = y + 1 >= colLimit ? (colLimit - 1) : (y + 1)
        
        let upperBoundary = x - 1 < 0 ? 0 : (x - 1)
        let downBoundary = x + 1 >= rowLimit ? (rowLimit - 1) : (x + 1)
        for j in leftBoundary...rightBoundary {
            for i in upperBoundary...downBoundary {
                sum += data[i][j]
            }
        }
        
        result[x][y] = sum / ((downBoundary - upperBoundary + 1) * (rightBoundary - leftBoundary + 1))
    }

}