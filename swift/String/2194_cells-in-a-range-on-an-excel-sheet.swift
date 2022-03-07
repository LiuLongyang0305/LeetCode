// https://leetcode.com/problems/cells-in-a-range-on-an-excel-sheet/
class Solution {
    let cols = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let rows = "123456789"
    func cellsInRange(_ s: String) -> [String] {
        let chars = [Character](s)
        let (startCol,startRow,endCol,endRow) = (chars[0],chars[1],chars[3],chars[4])
        var ans = [String]()
        for col in cols  {
            guard col >= startCol && col <= endCol else {
                continue
            }
            for row in rows {
                guard row >= startRow && row <= endRow else {continue}
                ans.append("\(col)\(row)")
            }
        }
        return ans
    }
}