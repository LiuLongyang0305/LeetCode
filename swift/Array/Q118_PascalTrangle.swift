//https://leetcode.com/problems/pascals-triangle/
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        guard numRows > 0 else {
            return result
        }
        for i in 1...numRows {
            if i <= 2 {
                result.append(Array<Int>(repeating: 1, count: i))
            } else {
                var row = Array<Int>(repeating: 1, count: i)
                let lastRow = result.last!
                for j in 1...i/2 {
                    row[j] = lastRow[j-1] + lastRow[j]
                    row[i - j - 1] = row[j]
                }
                result.append(row)
            }
        }
        return result
    }
}