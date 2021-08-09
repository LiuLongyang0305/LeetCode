// https://leetcode.com/problems/remove-stones-to-minimize-the-total/
import CoreFoundation
extension CFBinaryHeap {
    public static func getMaxHeapOfInt() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = { a,b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareGreaterThan : .compareLessThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
class Solution {
    func minStoneSum(_ piles: [Int], _ k: Int) -> Int {
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        let heap = CFBinaryHeap.getMaxHeapOfInt()
        for pile in piles {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: pile)
            CFBinaryHeapAddValue(heap, pointer)
        }
        var ans = piles.reduce(0) { $0 + $1}
        for _ in 0..<k {
            guard CFBinaryHeapGetCount(heap) > 0  else {
                break
            }
            let top = CFBinaryHeapGetMinimum(heap).load(as: Int.self)
            CFBinaryHeapRemoveMinimumValue(heap)
            let half = (top % 2 == 0 ? top : (top - 1)) >> 1
            ans -= half
            let remain = top - half
            if remain > 1 {
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: remain)
                CFBinaryHeapAddValue(heap, pointer)
            }
        }
        defer {
            pointer.deallocate()
            CFBinaryHeapRemoveAllValues(heap)
        }
        return ans
    }
}