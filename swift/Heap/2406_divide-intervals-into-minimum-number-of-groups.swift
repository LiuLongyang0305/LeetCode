// https://leetcode.com/problems/divide-intervals-into-minimum-number-of-groups/
import CoreFoundation
extension CFBinaryHeap {
    static public func getMaxHeapOfInt() -> CFBinaryHeap? {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a, b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareGreaterThan : .compareLessThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
    static public func getMinHeapOfInt() -> CFBinaryHeap? {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a, b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
class Solution {
    func minGroups(_ intervals: [[Int]]) -> Int {
        let sortedIntervals = intervals.sorted { inter1, inter2 in
            inter1[0] < inter2[0]
        }
        let minHeap = CFBinaryHeap.getMinHeapOfInt()
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)

        func add(_ val: Int) {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: val)
            CFBinaryHeapAddValue(minHeap, pointer)
        }


        for interval in sortedIntervals {
            let (l,r) = (interval[0],interval[1])
            if CFBinaryHeapGetCount(minHeap) == 0 {
                add(r)
            } else {
                let top = CFBinaryHeapGetMinimum(minHeap).load(as: Int.self)
                if l > top {
                    CFBinaryHeapRemoveMinimumValue(minHeap)
                }
                add(r)
            }
        }
        return CFBinaryHeapGetCount(minHeap)
    }
}