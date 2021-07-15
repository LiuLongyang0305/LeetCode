// https://leetcode-cn.com/problems/the-skyline-problem/
import CoreFoundation
let MASK = 0xffffffff
extension CFBinaryHeap {
    public static func getMaxHeap() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a,b,_ in
            let x = a!.load(as: Int.self) & MASK
            let y = b!.load(as: Int.self) & MASK
            return x == y ? .compareEqualTo : (x < y ? .compareGreaterThan : .compareLessThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}

struct Event: Comparable,CustomStringConvertible {
    var description: String {
        return "(\(x),\(height))"
    }
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        if lhs.x == rhs.x {
            return lhs.height * lhs.type > rhs.height * rhs.type
        }
        return lhs.x < rhs.x
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
    var id: Int
    var x: Int
    var height: Int
    var type: Int
}
class Solution {
    
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        let maxHeap = CFBinaryHeap.getMaxHeap()
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        var events = [Event]()
        for idx in 0..<buildings.count {
            events.append(Event(id: idx, x: buildings[idx][0], height: buildings[idx][2], type: 1))
            events.append(Event(id: idx, x: buildings[idx][1], height: buildings[idx][2], type: -1))
        }
        //标杆
        pointer.initialize(to: 100005 << 32)
        CFBinaryHeapAddValue(maxHeap, pointer)
        events.sort()
        // print(events)
        var ans = [[Int]]()
        var removedId = Array<Bool>(repeating: false, count: buildings.count)
        for event in events {
            //进入事件
            if event.type == 1 {
                while true {
                    let top = CFBinaryHeapGetMinimum(maxHeap).load(as: Int.self)
                    let id = top >> 32
                    if  id <  buildings.count && removedId[top >> 32] {
                        CFBinaryHeapRemoveMinimumValue(maxHeap)
                    } else {
                        // print("\(event.height)    \(top & MASK)")
                        if event.height > top & MASK {
                            ans.append([event.x,event.height])
                        }
                        break
                    }
                }
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: (event.id << 32) | event.height)
                CFBinaryHeapAddValue(maxHeap, pointer)
            } else {
                removedId[event.id] = true
                while true {
                    let top = CFBinaryHeapGetMinimum(maxHeap).load(as: Int.self)
                    let id = top >> 32

                    if id < buildings.count && removedId[top >> 32] {
                        CFBinaryHeapRemoveMinimumValue(maxHeap)
                    } else {
                        // print("\(event.height)    \(top & MASK)")
                        if event.height > top & MASK {
                            ans.append([event.x,top & MASK])
                        }
                        break
                    }
                }
            }
        }
        pointer.deallocate()
        CFBinaryHeapRemoveAllValues(maxHeap)
        return ans
    }
}