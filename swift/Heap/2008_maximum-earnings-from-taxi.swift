// https://leetcode.com/problems/maximum-earnings-from-taxi/
import CoreFoundation

extension CFBinaryHeap {
    public static func getMinHeapOfInfo() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = {  a,b,_ in
            let x = a!.load(as: Info.self)
            let y = b!.load(as: Info.self)
            return x.end == y.end ? .compareEqualTo : (x.end < y.end ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}

struct Info {
    var end:Int
    var profit:Int
}
class Solution {
    func maxTaxiEarnings(_ n: Int, _ rides: [[Int]]) -> Int {
        let sortedRides = rides.sorted { r1, r2 in
            r1[0] < r2[0]
        }
        
        var pointer: UnsafeMutablePointer<Info> = .allocate(capacity: 1)
        let minHeap = CFBinaryHeap.getMinHeapOfInfo()
        
        var ans = 0
        var maxProfit = 0
        //入堆
        pointer.initialize(to: Info(end: 0, profit: 0))
        CFBinaryHeapAddValue(minHeap, pointer)
        
        for ride in sortedRides {
            while CFBinaryHeapGetCount(minHeap) > 0 {
                let top = CFBinaryHeapGetMinimum(minHeap).load(as: Info.self)
                guard top.end <= ride[0]  else {break}
                maxProfit = max(maxProfit, top.profit)
                CFBinaryHeapRemoveMinimumValue(minHeap)
            }
            
            let newInfo = Info(end: ride[1], profit: maxProfit + ride[1] - ride[0] + ride[2])
            ans = max(ans, newInfo.profit)
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: newInfo)
            CFBinaryHeapAddValue(minHeap, pointer)
        }

        defer {
            pointer.deallocate()
            CFBinaryHeapRemoveAllValues(minHeap)
        }
        return ans
    }
}