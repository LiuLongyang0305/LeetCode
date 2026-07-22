// https://leetcode.cn/problems/create-grid-with-exactly-k-paths-i/
func transpose<T>(_ matrix: [[T]]) -> [[T]]? {
        // 边界检查
        guard !matrix.isEmpty else { return [] }

        let rowCount = matrix.count
        let colCount = matrix[0].count

        // 检查是否为规则矩阵（每行长度相同）
        guard matrix.allSatisfy({ $0.count == colCount }) else {
            print("错误：矩阵各行长度不一致")
            return nil
        }

        // 转置核心逻辑
        var result = Array(repeating: Array(repeating: matrix[0][0], count: rowCount),
                           count: colCount)

        for i in 0..<rowCount {
            for j in 0..<colCount {
                result[j][i] = matrix[i][j]
            }
        }

        return result
    }

class Solution {
    func createGrid(_ m: Int, _ n: Int, _ k: Int) -> [String] {
        if m <= n {
            return solve(m, n, false,k)
        } else {
            return solve(n, m, true,k)
        }
    }


    private func  solve(_ row: Int,_ col:Int, _ isReversed: Bool,_ k:Int) -> [String] {
        var chars = [[Character]](repeating: [Character](repeating: "#", count: col), count: row)
        var isExisted = false
        if k == 1 {
            isExisted = true
            for c in 0..<col {
                chars[0][c] = "."
            }
            if row > 1 {
                for r in 1..<row {
                    chars[r][col - 1] = "."
                }
            }
        }
        if k == 2 {
            if row >= 2 && col >= 2 {
                isExisted = true
                chars[0][0] = "."
                chars[0][1] = "."
                chars[1] = [Character](repeating: ".", count: col)
                for r in stride(from: 2, to: row, by: 1) {
                    chars[r][col - 1] = "."
                }
            }
        }
        if k == 3 {
            if row >= 2 && col >= 3 {
                isExisted = true
                chars[0][0] = "."
                chars[0][1] = "."
                chars[0][2] = "."
                chars[1] = [Character](repeating: ".", count: col)
                for r in stride(from: 2, to: row, by: 1) {
                    chars[r][col - 1] = "."
                }
            }
        }
        if k == 4 {
            //两种情况：4 * 2  && 3 * 3
            if col >= 4 && row >= 2 {
                isExisted = true
                chars[0][0] = "."
                chars[0][1] = "."
                chars[0][2] = "."
                chars[0][3] = "."
                chars[1] = [Character](repeating: ".", count: col)
                for r in stride(from: 2, to: row, by: 1) {
                    chars[r][col - 1] = "."
                }
            }
            if row == 3 && col == 3 {
                isExisted = true
                chars = [[Character]](repeating: [Character](repeating: ".", count: col), count: row)
                chars[0][2] = "#"
                chars[2][0] = "#"
            }
        }
        guard isExisted else {return []}
        if isReversed {
            chars = transpose(chars)!
        }
        return chars.map { String($0) }
    }

}
