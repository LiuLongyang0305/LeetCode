// https://leetcode.com/problems/find-valid-matrix-given-row-and-column-sums/
class Solution {
    func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
        let M = rowSum.count
        let N = colSum.count
        var row = rowSum
        var col = colSum
        var ans = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: M)
        for r in 0..<M {
            for c in 0..<N {
                ans[r][c] = min(row[r], col[c])
                row[r] -= ans[r][c]
                col[c] -= ans[r][c]
            }
        }
        return ans
    }
}