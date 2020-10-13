// https://leetcode.com/problems/longest-line-of-consecutive-one-in-matrix/
class Solution {
    func longestLine(_ M: [[Int]]) -> Int {
        guard !M.isEmpty else {
            return 0
        }
        guard !M[0].isEmpty else {
            return 0
        }
        var ans = 0
        let row = M.count
        let col = M[0].count
        var mask = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: col), count: row)
        for r in 0..<row {
            for c in 0..<col {
                if M[r][c] == 1 {
                    //right
                    if mask[r][c] & 1 == 0 {
                        mask[r][c] |= 1
                        var cnt = 1
                        var tempCol = c + 1
                        while tempCol < col && M[r][tempCol] == 1 {
                            mask[r][tempCol] != 1
                            cnt += 1
                            tempCol += 1
                        }
                        ans = max(ans, cnt)
                    }
                    //down
                    if mask[r][c] & 2 == 0 {
                        var cnt = 1
                        mask[r][c] |= 2
                        var tempRow = r + 1
                        while tempRow < row && M[tempRow][c] == 1 {
                            mask[tempRow][c] |= 2
                            cnt += 1
                            tempRow += 1
                        }
                        ans = max(ans, cnt)
                    }
                    // right-down
                    if mask[r][c] & 4 == 0 {
                        var cnt = 0
                        var tempRow = r
                        var tempCol = c
                        while tempRow < row && tempCol < col && M[tempRow][tempCol] == 1 {
                            cnt += 1
                            mask[tempRow][tempCol] |= 4
                            tempRow += 1
                            tempCol += 1
                        }
                        ans = max(ans, cnt)
                    }
                    //left-down
                    if mask[r][c] & 8 == 0 {
                        var cnt = 0
                        var tempRow = r
                        var tempCol = c
                        while tempRow < row && tempCol >= 0 && M[tempRow][tempCol] == 1 {
                            cnt += 1
                            mask[tempRow][tempCol] |= 8
                            tempRow += 1
                            tempCol -= 1
                        }
                        ans = max(ans, cnt)
                    }
                }
            }
        }
        return ans
    }
}
