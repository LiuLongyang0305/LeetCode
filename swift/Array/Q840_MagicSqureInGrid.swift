//https://leetcode.com/problems/magic-squares-in-grid/
class Solution {
    var grid = [[Int]]()
    var xLimit = 0
    var yLimit = 0
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        guard grid.count > 2 && grid[0].count > 2 else {
            return 0
        }
        self.grid = grid
        self.xLimit = grid.count
        self.yLimit = grid[0].count
        var magicalSquareCount = 0
        for i in 0..<(xLimit - 2) {
            for j in 0..<(yLimit - 2) {
                if isMagicSqure(startX: i, startY: j) {
                    magicalSquareCount += 1
                }
            }
        }
       return magicalSquareCount
    }
    private func isMagicSqure(startX: Int, startY: Int) -> Bool {
        guard startX + 2 < grid.count &&  startY + 2 < yLimit else {
            return false
        }
        var rowSum = Array<Int>(repeating: 0, count: 3)
        var colSum = Array<Int>(repeating: 0, count: 3)
        var diagonal = Array<Int>(repeating: 0, count: 2)
        var numberLimited = Set<Int>(1...9)

        for i in 0...2 {
            let currentRow = startX + i
            for j in 0...2 {
                let currentCol = startY + j
                let ele = grid[currentRow][currentCol]
                if !numberLimited.contains(ele) {
                    return false
                }
                numberLimited.remove(ele)
                rowSum[i] += ele
                colSum[j] += ele
                if i == j {
                    diagonal[0] += ele
                }
                if i + j == 2 {
                    diagonal[1] += ele
                }
            }
        }
        rowSum.append(contentsOf: colSum)
        rowSum.append(contentsOf: diagonal)
        return rowSum.max()! == rowSum.min()!
    }
}