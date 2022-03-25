// https://leetcode.com/problems/minimum-operations-to-halve-array-sum/
import CoreFoundation
extension CFBinaryHeap {
    static public func getMaxHeapOfDouble() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a, b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareGreaterThan : .compareLessThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}




class Solution {
    func halveArray(_ nums: [Int]) -> Int {
        var total = 0.0
        
        let maxHeap = CFBinaryHeap.getMaxHeapOfDouble()
        var pointer: UnsafeMutablePointer<Double> = .allocate(capacity: 1)
        
        nums.forEach { num in
            let t = Double(num)
            total += t
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: t)
            CFBinaryHeapAddValue(maxHeap, pointer)
        }
        let target = total / 2.0
        var cur = 0.0
        var cnt = 0
        
        while true {
            let top = CFBinaryHeapGetMinimum(maxHeap).load(as: Double.self)
            let t = top / 2.0
            cur += t
            cnt += 1
            guard cur < target else {
                return cnt
            }
            CFBinaryHeapRemoveMinimumValue(maxHeap)
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: t)
            CFBinaryHeapAddValue(maxHeap, pointer)
        }
    }
}
