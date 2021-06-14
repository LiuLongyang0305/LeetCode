// https://leetcode.com/problems/minimum-number-of-refueling-stops/
import CoreFoundation
extension CFBinaryHeap {
    static func getMaxheap() -> CFBinaryHeap{
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {a,b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? 0 : (x < y ? 1 : -1)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
class Solution {
    func minRefuelStops(_ target: Int, _ startFuel: Int, _ ss: [[Int]]) -> Int {
        var ans = 0
        let stations = ss + [[target,0]]
        var lastPos = 0
        let maxheap = CFBinaryHeap.getMaxheap()
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        var remainFuel = startFuel
        for station in stations {
            let location = station[0]
            let capacity = station[1]
            remainFuel -= location - lastPos
            print("\(remainFuel)   \(station)")
            while CFBinaryHeapGetCount(maxheap) > 0 && remainFuel < 0 {
                let top = CFBinaryHeapGetMinimum(maxheap).load(as: Int.self)
                print(top)
                remainFuel += top
                ans += 1
                CFBinaryHeapRemoveMinimumValue(maxheap)
            }
            if remainFuel < 0 {
                return -1
            }
            lastPos = location
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: capacity)
            CFBinaryHeapAddValue(maxheap, pointer)
        }
        pointer.deallocate()
        return ans
    }
}

