// https://leetcode.com/problems/sparse-matrix-multiplication/
class Solution {
    func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        let M = A.count
        let N = B[0].count
        var cols = Array<Array<Int>>(repeating: [], count: N)
        for i in 0..<B.count {
            for j in 0..<N {
                cols[j].append(B[i][j])
            }
        }
        var ans = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: M)
        for i in 0..<M {
            for j in 0..<N {
                for k in 0..<A[0].count {
                    ans[i][j]  += cols[j][k] * A[i][k]
                }
            }
        }
        return ans
    }
}
