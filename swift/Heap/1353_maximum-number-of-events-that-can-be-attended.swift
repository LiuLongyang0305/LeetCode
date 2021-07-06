// https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended/
import CoreFoundation
extension CFBinaryHeap {
    static func getMinHeapOfEvent() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = { a,b,_ in
            let e1 = a!.load(as: Int.self)
            let e2 = b!.load(as: Int.self)
            return e1 == e2 ? .compareEqualTo : (e1 < e2 ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
class Solution {
    func maxEvents(_ events: [[Int]]) -> Int {
        let sortedEvents = events.sorted { e1, e2 in
            return e1[0] < e2[0]
        }
        var i = 0
        var ans = 0
        let n = events.count
        
        let minHeap = CFBinaryHeap.getMinHeapOfEvent()
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        
        for day in 1...100000 {
            while CFBinaryHeapGetCount(minHeap) > 0  {
                let top = CFBinaryHeapGetMinimum(minHeap).load(as: Int.self)
                if top >= day {
                    break
                }
                CFBinaryHeapRemoveMinimumValue(minHeap)
            }
            while i < n && sortedEvents[i][0] == day {
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: sortedEvents[i][1])
                CFBinaryHeapAddValue(minHeap, pointer)
                i += 1
            }
            if CFBinaryHeapGetCount(minHeap) > 0 {
                ans += 1
                CFBinaryHeapRemoveMinimumValue(minHeap)
            }
        }
        CFBinaryHeapRemoveAllValues(minHeap)
        pointer.deallocate()
        return ans
    }
}


