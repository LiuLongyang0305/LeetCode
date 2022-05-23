
// https://leetcode.com/problems/range-sum-query-2d-mutable/
class BinaryIndexTree {
    private var tree:[Int]
    private var n: Int
    init(_ _n: Int) {
        self.tree = [Int](repeating: 0, count: _n + 1)
        self.n = _n
    }
    private func lowBit(_ x: Int) -> Int{
        return x & (-x)
    }
    func update(_ node: Int, _ delta: Int) {
        var curNode = node
        while curNode <= n {
            tree[curNode] += delta
            curNode += lowBit(curNode)
        }
    }
    func query(_ node: Int) -> Int {
        var ans  = 0
        var curNode = node

        while curNode > 0 {
            ans += tree[curNode]
            curNode -= lowBit(curNode)
        }
        return ans
    }

    func query(_ left: Int, _ right: Int) -> Int {
        return query(right) - query(left - 1)
    }
}



class NumMatrix {

    private let binaryIndexTree:BinaryIndexTree
    private var M: Int
    private var N: Int
    private var values: [[Int]]
    init(_ matrix: [[Int]]) {
        self.M = matrix.count
        self.N = matrix[0].count
        self.binaryIndexTree = BinaryIndexTree(M * N)
        self.values = matrix

        for r in 0..<M {
            for c in 0..<N {
                binaryIndexTree.update(getIndex(r, c), matrix[r][c])
            }
        }
    }

    func update(_ row: Int, _ col: Int, _ val: Int) {
        binaryIndexTree.update(getIndex(row, col), val - values[row][col])
        values[row][col] = val
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var ans = 0
        var r = row1
        while r <= row2 {
            let left = getIndex(r, col1)
            let right = getIndex(r, col2)
            ans += binaryIndexTree.query(left, right)
            r += 1
        }
        return ans
    }


    private func getIndex(_ r: Int, _ c: Int) -> Int {
        return r * N + c + 1
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * obj.update(row, col, val)
 * let ret_2: Int = obj.sumRegion(row1, col1, row2, col2)
 */