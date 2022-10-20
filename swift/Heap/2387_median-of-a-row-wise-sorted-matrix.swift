// https://leetcode.cn/problems/median-of-a-row-wise-sorted-matrix/
import CoreFoundation
struct Triple {
    var r: Int
    var c: Int
    var val: Int
}

extension CFBinaryHeap {
    public static func getMaxHeapOfTriple() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = { a,b,_ in
            let x = a!.load(as: Triple.self)
            let y = b!.load(as: Triple.self)
            return x.val < y.val ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
class Solution {
    func matrixMedian(_ grid: [[Int]]) -> Int {
        var pointer: UnsafeMutablePointer<Triple> = .allocate(capacity: 1)
        let heap = CFBinaryHeap.getMaxHeapOfTriple()

        func add(_ r:Int,_ c: Int) {
            let triple = Triple(r: r, c: c, val: grid[r][c])
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: triple)
            CFBinaryHeapAddValue(heap, pointer)
        }
        let M = grid.count
        for r in 0..<M {
            add(r, 0)
        }
        let N = grid[0].count
        var popCnt = 0
        let targetCnt = M * N / 2

        while popCnt < targetCnt {

            let top = CFBinaryHeapGetMinimum(heap).load(as: Triple.self)
            CFBinaryHeapRemoveMinimumValue(heap)

            if top.c < N - 1 {
                add(top.r, top.c + 1)
            }

            popCnt += 1
        }
        let top = CFBinaryHeapGetMinimum(heap).load(as: Triple.self)
        return top.val
    }
}