//  https://leetcode.com/problems/matrix-block-sum/
class Solution {
    func matrixBlockSum(_ mat: [[Int]], _ K: Int) -> [[Int]] {
        
        let M = mat.count
        let N = mat[0].count
        var pre = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N + 1), count: M + 1)
        for r in 1...M {
            for c in 1...N {
                pre[r][c] = pre[r - 1][c] + pre[r][c - 1] - pre[r - 1][c - 1] + mat[r - 1][c - 1]
            }
        }
        var ans = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: M)
        for r in 1...M {
            for c in 1...N {
                let lx = max(1, r - K), ly = max(1, c - K),rx = min(M, r + K),ry = min(N, c + K)
                ans[r - 1][c - 1] = pre[rx][ry] + pre[lx - 1][ly - 1] - pre[rx][ly - 1] - pre[lx - 1][ry]
            }
        }
        return ans
    }
 }