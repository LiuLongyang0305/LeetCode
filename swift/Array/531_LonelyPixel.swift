// https://leetcode.com/problems/lonely-pixel-i/
class Solution {
    func findLonelyPixel(_ picture: [[Character]]) -> Int {
        let M = picture.count
        let N = picture[0].count
        var counterRow = Array<Int>(repeating: 0, count: M)
        var counterCol = Array<Int>(repeating: 0, count: N)
        for r in 0..<M {
            for c in 0..<N {
                if picture[r][c] == "B" {
                    counterRow[r] += 1
                    counterCol[c] += 1
                }
            }
        }
        let possibleRows = (0..<M).filter { counterRow[$0] < 2}
        let possibleCols = (0..<N).filter { counterCol[$0] < 2}
        var ans = 0
        for r in possibleRows {
            for c in possibleCols {
                if picture[r][c] == "B" {
                    ans += 1
                }
            }
        }
        return ans
    }
}
