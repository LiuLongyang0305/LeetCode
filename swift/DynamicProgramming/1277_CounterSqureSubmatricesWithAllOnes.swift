//https://leetcode.com/problems/count-square-submatrices-with-all-ones/
class Solution {
    private var matrix = [[Bool]]()
    private var row = -1
    private var col = -1
    func countSquares(_ matrix: [[Int]]) -> Int {
        row = matrix.count
        col = matrix[0].count
        self.matrix = matrix.map({$0.map {$0 == 1}})
        var ans = 0
        for i in 0..<row {
            for j in 0..<col {
                if self.matrix[i][j] {
                    ans += countSqures(leftUp: [i,j])
                }
            }
        }
        return ans
    }
    
    private func countSqures(leftUp point: [Int]) -> Int{
        var ans = 0
        let maxSqureLength = min(row - point[0], col - point[1])
        let x = point[0]
        let y = point[1]
        func valid(_ edgeLength: Int) -> Bool {
            if edgeLength == 1 {
                return matrix[x][y]
            }
            let lastRowIndex = x + edgeLength - 1
            let lastColIndex = y + edgeLength - 1
            for deltaY in 0..<edgeLength {
                if !matrix[lastRowIndex][y + deltaY] {
                    return false
                }
            }
            for deltaX in 0..<edgeLength {
                if !matrix[x + deltaX][lastColIndex] {
                    return false
                }
            }
            return true
        }
        for edgeLength in 1...maxSqureLength {
            if valid(edgeLength) {
                ans += 1
                continue
            }
            return ans
        }
        return ans
    }
 }