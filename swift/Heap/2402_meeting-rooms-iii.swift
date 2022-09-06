// https://leetcode.com/problems/meeting-rooms-iii/
import CoreFoundation
// import Accelerate

struct MeetingRoom {
    var num: Int
    var emptyTime:Int
}

extension CFBinaryHeap {
    static public func getMinHeapOfMeetingRoom() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a, b,_ in
            let x = a!.load(as: MeetingRoom.self)
            let y = b!.load(as: MeetingRoom.self)
            guard x.emptyTime != y.emptyTime else {
                return x.num < y.num ? .compareLessThan : .compareGreaterThan
            }
            return x.emptyTime < y.emptyTime ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}

class Solution {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        let sortedMeetings = meetings.sorted { m1, m2 in
            m1[0] < m2[0]
        }
        print(sortedMeetings)




        var counter = [Int](repeating: 0, count: n)
        let busyHeap = CFBinaryHeap.getMinHeapOfMeetingRoom()
        let emptyHeap = CFBinaryHeap.getMinHeapOfMeetingRoom()
        var pointer : UnsafeMutablePointer<MeetingRoom> = .allocate(capacity: 1)


        func add(_ heap: CFBinaryHeap, _ val: MeetingRoom) {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: val)
            CFBinaryHeapAddValue(heap, pointer)

        }

        for i in 0..<n {
            add(emptyHeap, MeetingRoom(num: i, emptyTime: 0))
        }

        for meet in sortedMeetings {

            let (startTime,endTime) = (meet[0],meet[1])
            while CFBinaryHeapGetCount(busyHeap) > 0 {
                var top = CFBinaryHeapGetMinimum(busyHeap).load(as: MeetingRoom.self)
                guard top.emptyTime <= startTime else {
                    break
                }
                CFBinaryHeapRemoveMinimumValue(busyHeap)
                top.emptyTime = 0
                add(emptyHeap, top)
            }

            if CFBinaryHeapGetCount(emptyHeap) > 0 {
                var top = CFBinaryHeapGetMinimum(emptyHeap).load(as: MeetingRoom.self)
                CFBinaryHeapRemoveMinimumValue(emptyHeap)
                counter[top.num] += 1
                top.emptyTime = endTime
               add(busyHeap, top)
            } else {
                var top = CFBinaryHeapGetMinimum(busyHeap).load(as: MeetingRoom.self)
                CFBinaryHeapRemoveMinimumValue(busyHeap)
                counter[top.num] += 1
                top.emptyTime += endTime - startTime
                add(busyHeap, top)
            }
        }

        let maxCnt = counter.max() ?? -1
        return counter.firstIndex(of: maxCnt) ?? -1

    }
}


class Solution {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        let sortedMeetings = meetings.sorted { m1, m2 in
            m1[0] < m2[0]
        }
        // print(sortedMeetings)
        var counter = [Int](repeating: 0, count: n)
        var emptyTime = [Int](repeating: 0, count: n)
        for meeting in sortedMeetings {
            let (s,e) = (meeting[0],meeting[1])
            for i in 0..<n {
                if emptyTime[i] <= s {
                    emptyTime[i] = 0
                }
            }
            var targetNum = 0
            for i in 0..<n {
                if emptyTime[i] < emptyTime[targetNum] {
                    targetNum = i
                }
            }
            counter[targetNum] += 1
            if emptyTime[targetNum] == 0 {
                emptyTime[targetNum] = e
            } else {
                emptyTime[targetNum] += e - s
            }
            // print(emptyTime)
        }
        let maxCnt = counter.max() ?? -1
        return counter.firstIndex(of: maxCnt) ?? -1

    }
}