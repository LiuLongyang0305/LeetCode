    // https://leetcode.cn/problems/design-a-3d-binary-matrix-with-efficient-layer-tracking/
    class Matrix3D {

        private var martrix = [Int:[Int:Set<Int>]]()
        private struct Info: Comparable {
            static func < (lhs: Matrix3D.Info, rhs: Matrix3D.Info) -> Bool {
                if lhs.cnt == rhs.cnt {
                    return lhs.row < rhs.row
                }
                return lhs.cnt < rhs.cnt
            }
            
            var row:Int
            var cnt: Int
        }
        private var heap = Heap<Info>()
        private var rowToCnt = [Int:Int]()

        init(_ n: Int) {
            for i in 0..<n {
                heap.insert(Info(row: i, cnt: 0))
                rowToCnt[i] = 0
            }
        }

        func setCell(_ x: Int, _ y: Int, _ z: Int) {
            if let onesZ = martrix[x]?[y],onesZ.contains(z) {
                    return
            }
            martrix[x,default: [:]][y,default: []].insert(z)
            rowToCnt[x,default: 0] += 1
            heap.insert(Info(row: x, cnt: rowToCnt[x] ?? 0))
        }

        func unsetCell(_ x: Int, _ y: Int, _ z: Int) {
            guard var onesZ = martrix[x]?[y],onesZ.contains(z) else {return}
            onesZ.remove(z)
            martrix[x]?[y] = onesZ
            rowToCnt[x,default: 0] -= 1
            heap.insert(Info(row: x, cnt: rowToCnt[x] ?? 0))
        }

        func largestMatrix() -> Int {
            while let top = heap.max, top.cnt != rowToCnt[top.row] {
                let _ = heap.popMax()
            }
            return heap.max?.row ?? -1
        }
    }
/**
 * Your Matrix3D object will be instantiated and called as such:
 * let obj = Matrix3D(n)
 * obj.setCell(x, y, z)
 * obj.unsetCell(x, y, z)
 * let ret_3: Int = obj.largestMatrix()
 */
