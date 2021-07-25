// https://leetcode.com/problems/the-number-of-the-smallest-unoccupied-chair/
import CoreFoundation

typealias Info = (id:Int,leavingTime:Int,position:Int)
extension CFBinaryHeap {
    public static func getMinHeapOfInt() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a,b,_ in
            
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareLessThan : .compareGreaterThan)
            
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
    public static func getMinHeapOfInfo() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a,b,_ in
            
            let x = a!.load(as: Info.self)
            let y = b!.load(as: Info.self)
            return x.leavingTime == y.leavingTime ? .compareEqualTo : (x.leavingTime < y.leavingTime ? .compareLessThan : .compareGreaterThan)
            
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
class Solution {
    func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
        
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        let heap = CFBinaryHeap.getMinHeapOfInt()
        let leaveingHeap = CFBinaryHeap.getMinHeapOfInfo()
        var pointerToInfo: UnsafeMutablePointer<Info> = .allocate(capacity: 1)
        let N = times.count

        for time in 0...N {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: time)
            CFBinaryHeapAddValue(heap, pointer)
        }
        let sortedFriendId = (0..<N).sorted { f1, f2 in
            return times[f1][0] < times[f2][0]
        }
        
        for friend in sortedFriendId {
            let arrivingTime = times[friend][0]
            while CFBinaryHeapGetCount(leaveingHeap) > 0 {
                let top = CFBinaryHeapGetMinimum(leaveingHeap).load(as: Info.self)
                guard top.leavingTime <= arrivingTime else {
                    break
                }
                CFBinaryHeapRemoveMinimumValue(leaveingHeap)
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: top.position)
                CFBinaryHeapAddValue(heap, pointer)
            }
            let top = CFBinaryHeapGetMinimum(heap).load(as: Int.self)
            if friend == targetFriend {
                return top
            }
            CFBinaryHeapRemoveMinimumValue(heap)
            let info: Info = (friend,times[friend][1],top)
            pointerToInfo = .allocate(capacity: 1)
            pointerToInfo.initialize(to: info)
            CFBinaryHeapAddValue(leaveingHeap, pointerToInfo)
        }
        defer {
            pointer.deallocate()
            CFBinaryHeapRemoveAllValues(heap)
            pointerToInfo.deallocate()
            CFBinaryHeapRemoveAllValues(leaveingHeap)
        }
        
        return -1
    }
}