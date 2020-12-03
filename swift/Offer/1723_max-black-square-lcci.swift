// https://leetcode-cn.com/problems/max-black-square-lcci/
class Solution {
    func findSquare(_ matrix: [[Int]]) -> [Int] {
        let N = matrix.count
        var rowsOnes = matrix
        for r in 0..<N {
            rowsOnes[r][N - 1] = 1 - matrix[r][N - 1]
            var c = N - 2
            while c >= 0 {
                rowsOnes[r][c] = matrix[r][c] == 1 ? 0 : (rowsOnes[r][c + 1] + 1)
                c -= 1
            }
        }
        var colOnes = matrix
        for c in 0..<N {
            colOnes[N - 1][c] = 1 - matrix[N - 1][c]
            var r = N - 2
            while r >= 0 {
                colOnes[r][c] = matrix[r][c] == 1 ? 0 : (colOnes[r + 1][c] + 1)
                r -= 1
            }
        }
        var ans = (-1,-1,-1)
        func getMaxSizeOf(_ r: Int, _ c: Int) -> Int {
            let maxSize = min(colOnes[r][c],rowsOnes[r][c])
//            print("\(#function)  r = \(r)  c = \(c) max = \(maxSize)")
            guard maxSize > ans.2 else {
                return -1
            }
            var size = maxSize
            while size > 1 {
                let low = r + size - 1
                let right = c + size - 1
                if rowsOnes[low][c] - (c + size >= N ? 0 : rowsOnes[low][c + size]) == size && colOnes[r][right] - (r + size >= N ? 0 : colOnes[r + size][right]) == size {
                    return size
                }
                size -= 1
            }
            return 1
        }
        for r in 0..<N {
            for c in 0..<N {
                if matrix[r][c] == 0 {
                    let size = getMaxSizeOf(r, c)
                    if size > ans.2 {
                        ans = (r,c,size)
                    }
                }
            }
        }
        return ans == (-1,-1,-1) ? [] : [ans.0,ans.1,ans.2]
    }
}