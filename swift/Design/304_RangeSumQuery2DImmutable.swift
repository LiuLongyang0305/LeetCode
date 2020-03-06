 // https://leetcode.com/problems/range-sum-query-2d-immutable/
 class NumMatrix {
    private var prefix2D: [[Int]] = []
    private var M : Int = -1
    private var N : Int = -1
    init(_ matrix: [[Int]]) {
        guard !matrix.isEmpty else {
            return
        }
        guard !matrix[0].isEmpty else {
            return
        }
        M = matrix.count
        N = matrix[0].count
        prefix2D = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N + 1), count: M + 1)
        for r in 0..<M {
            for c in 0..<N {
                prefix2D[r + 1][c + 1] = prefix2D[r + 1][c] + prefix2D[r][c + 1] + matrix[r][c] - prefix2D[r][c]
            }
        }
        
    }
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return prefix2D[row2 + 1][ col2 + 1] - prefix2D[row1][ col2 + 1] - prefix2D[row2 + 1][ col1] + prefix2D[row1][ col1]
    }
 }

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */