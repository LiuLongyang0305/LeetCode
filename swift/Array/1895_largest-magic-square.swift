// https://leetcode.com/problems/largest-magic-square/
class Solution {
    func largestMagicSquare(_ grid: [[Int]]) -> Int {
        let M = grid.count
        let N = grid[0].count
        var colsPreffix = [[Int]]()
        var rowsPreffix = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: M + 1)
        for r in 0..<M {
            var newRow = [0]
            for c in 0..<N {
                rowsPreffix[r + 1][c] = grid[r][c] + rowsPreffix[r][c]
                newRow.append(newRow.last! + grid[r][c])
            }
            colsPreffix.append(newRow)
        }
        var ans = 1
        func check(_ r: Int, _ c: Int, _ length: Int) -> Bool {
            let up = colsPreffix[r][c + length] - colsPreffix[r][c]
            let MaxRow =  r + length - 1
            var row = r + 1
            while  row <= MaxRow {
                guard colsPreffix[row][c + length] - colsPreffix[row][c] == up else {
                    return false
                }
                 row += 1
            }
            let left = rowsPreffix[r + length ][c] - rowsPreffix[r][c]
            guard left == up else {
                return false
            }
            let maxCol = c + length - 1
            var col = c + 1
            while col <= maxCol {
                guard rowsPreffix[r + length][col] - rowsPreffix[r][col]  == up else {
                    return false
                }
                col += 1
            }
            var pie = 0
            var na = 0
            var r1 = r
            var c1 = c
            var c2 = c + length - 1
            for _ in 0..<length {
                pie += grid[r1][c1]
                na += grid[r1][c2]
                r1 += 1
                c1 += 1
                c2 -= 1
            }
            guard pie == up && na == up else {
                return false
            }
            return true
        }
        func getMaxLengthOf(r : Int, _ c: Int) -> Int?{
            let maxLength = min(M - r, N - c)
            var l = maxLength
            while l > ans {
                if check(r, c, l) {
                    return l
                }
                l -= 1
            }
            return nil
        }
        for r in 0..<M {
            for c in 0..<N {
                if let l = getMaxLengthOf(r: r, c) {
                    ans = max(ans, l)
                }
            }
        }
        return ans
    }
}