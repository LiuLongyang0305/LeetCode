// https://leetcode.com/problems/max-value-of-equation/
import CoreFoundation



struct Info{
    var idx: Int
    var val: Int
}

extension CFBinaryHeap {
    static public func getMaxHeapOfInfo() -> CFBinaryHeap? {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a, b,_ in
            let x = a!.load(as: Info.self)
            let y = b!.load(as: Info.self)
            return x.val > y.val ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}

class Solution {
    func findMaxValueOfEquation(_ points: [[Int]], _ k: Int) -> Int {

        let maxHeap = CFBinaryHeap.getMaxHeapOfInfo()
        var pointer: UnsafeMutablePointer<Info> = .allocate(capacity: 1)
        let M = points.count
        var sumXy = [Int](repeating: 0, count: M)
        for i in 0..<M {
            sumXy[i] = points[i][0] + points[i][1]
        }
        var ans = Int.min
        var right = 1

        for i in 0..<M {
            while CFBinaryHeapGetCount(maxHeap) > 0 {
                let top = CFBinaryHeapGetMinimum(maxHeap).load(as: Info.self)
                if top.idx <= i {
                    CFBinaryHeapRemoveMinimumValue(maxHeap)
                } else {
                    break
                }
            }
            right = max(i + 1,right)
            while right < M &&  points[right][0] - points[i][0] <= k {
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: Info(idx: right, val: sumXy[right]))
                CFBinaryHeapAddValue(maxHeap, pointer)
                right += 1
            }
            if CFBinaryHeapGetCount(maxHeap) > 0 {
                ans = max(ans, CFBinaryHeapGetMinimum(maxHeap).load(as: Info.self).val + points[i][1] - points[i][0] )
            }
        }
        return ans
    }
}