// https://leetcode.com/problems/remove-all-ones-with-row-and-column-flips/
class Solution {
    func removeOnes(_ grid: [[Int]]) -> Bool {
        let firstRow = grid[0]
        for row in grid {
            guard row == firstRow || row.map({ 1 - $0}) == firstRow   else {return false}
        }
        return true
    }
}
