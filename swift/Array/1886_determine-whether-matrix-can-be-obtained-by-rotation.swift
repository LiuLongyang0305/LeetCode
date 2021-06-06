// https://leetcode.com/problems/determine-whether-matrix-can-be-obtained-by-rotation/
class Solution {
    func findRotation(_ m: [[Int]], _ t: [[Int]]) -> Bool {
        let f = rotate(m)
        let s = rotate(f)
        let t1 = rotate(s)
        
        return m == t || f == t || s == t || t1 == t
    }
    private func rotate(_ mat: [[Int]]) -> [[Int]] {
        let N = mat.count
        var ans = Array<Array<Int>>(repeating: Array<Int>(repeating:0,count:N), count: N)
        var r = 0
        while r < N {
            let c = N - r - 1
            var j = 0
            while j < N {
                ans[j][c] = mat[r][j]
                j += 1
            }
            r += 1
        }
        return ans
    }
}
