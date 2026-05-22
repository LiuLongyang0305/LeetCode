// https://leetcode.cn/problems/largest-local-values-in-a-matrix-ii/
class Solution {
    func countLocalMaximums(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        let m = matrix[0].count
        let maxVal = 200
        
        // pref[v][i][j]: 矩形 (0,0) 到 (i-1,j-1) 中值 > v 的单元格数
        var pref = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1), count: maxVal+1)
        
        // 构建前缀和
        for v in 0...maxVal {
            for i in 1...n {
                for j in 1...m {
                    let val = matrix[i-1][j-1]
                    let inc = val > v ? 1 : 0
                    pref[v][i][j] = pref[v][i-1][j] + pref[v][i][j-1] - pref[v][i-1][j-1] + inc
                }
            }
        }
        
        var ans = 0
        for i in 0..<n {
            for j in 0..<m {
                let x = matrix[i][j]
                if x == 0 { continue }
                
                // 矩形范围
                let top = max(0, i - x)
                let bottom = min(n - 1, i + x)
                let left = max(0, j - x)
                let right = min(m - 1, j + x)
                
                // 查询矩形内值 > x 的数量
                var cnt = pref[x][bottom+1][right+1] - pref[x][top][right+1] - pref[x][bottom+1][left] + pref[x][top][left]
                
                // 减去四个角（如果它们在矩阵内且值 > x）
                let corners = [(i-x, j-x), (i-x, j+x), (i+x, j-x), (i+x, j+x)]
                for (r, c) in corners {
                    if r >= 0 && r < n && c >= 0 && c < m && matrix[r][c] > x {
                        cnt -= 1
                    }
                }
                
                if cnt == 0 {
                    ans += 1
                }
            }
        }
        return ans
    }
}
