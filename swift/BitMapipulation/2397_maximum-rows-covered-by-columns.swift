// https://leetcode.com/problems/maximum-rows-covered-by-columns/
class Solution {
    func maximumRows(_ mat: [[Int]], _ cols: Int) -> Int {
        let rows = mat.map { row -> Int in
            var t = 0
            for digit in row {
                t = t * 2 + digit
            }
            return t
        }
        let M = mat.count
        let N = mat[0].count
        var ans = 0
        for mask in 1..<(1 << N) {
            guard mask.nonzeroBitCount == cols else {continue}
            ans = max(ans, rows.reduce(0, { $0 + (mask | $1 == mask ? 1 : 0)}))
        }


        return ans
    }
}
