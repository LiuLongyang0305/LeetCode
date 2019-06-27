//https://leetcode.com/problems/pascals-triangle-ii/
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        let tempIndex = rowIndex + 1
        guard tempIndex > 2 else {
            return Array<Int>(repeating: 1, count: tempIndex)
        }
        
        var lastRow: [Int] = Array<Int>(repeating: 1, count: 2)
        
        for i in 3...tempIndex {
            var row = Array<Int>(repeating: 1, count: i)
            for j in 1...i/2 {
                row[j] = lastRow[j-1] + lastRow[j]
                row[i - j - 1] = row[j]
            }
            lastRow = row
        }
        return lastRow
    }
}