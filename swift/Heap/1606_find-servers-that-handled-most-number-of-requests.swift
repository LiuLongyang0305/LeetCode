// https://leetcode.com/problems/find-servers-that-handled-most-number-of-requests/
import CoreFoundation
struct Info{
    var server: Int
    var time: Int
}
extension CFBinaryHeap {
    static public func getMinHeapOfInfo() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a, b,_ in
            let x = a!.load(as: Info.self)
            let y = b!.load(as: Info.self)
            return x.time < y.time ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}

class Solution {
    func busiestServers(_ k: Int, _ arrival: [Int], _ load: [Int]) -> [Int] {

        guard k < arrival.count else {
            return [Int](0..<(min(k, arrival.count)))
        }
        var cnt = [Int](repeating: 0, count: k)
        var availableSevers = [Int.min] + [Int](0..<k) + [Int.max]
        var pointer: UnsafeMutablePointer<Info> = .allocate(capacity: 1)
        let busyServers = CFBinaryHeap.getMinHeapOfInfo()


        func binarySearchFirstIndexLargerThanOrEqualTo(_ target: Int) -> Int {
            var left = 0
            var right = availableSevers.count - 1
            while left < right {
                let mid = (left + right) >> 1
                if availableSevers[mid] < target {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left
        }



        let N = arrival.count

        for taskIdx in 0..<N {

            let startTime = arrival[taskIdx]
            let endTime = startTime + load[taskIdx]

            while CFBinaryHeapGetCount(busyServers) > 0 {
                let top = CFBinaryHeapGetMinimum(busyServers).load(as: Info.self)
                guard top.time <= startTime else {break}
                let pos = binarySearchFirstIndexLargerThanOrEqualTo(top.server)
                availableSevers.insert(top.server, at: pos)
                CFBinaryHeapRemoveMinimumValue(busyServers)
            }
            guard availableSevers.count > 2 else {continue}

            let target = taskIdx % k

            var pos = binarySearchFirstIndexLargerThanOrEqualTo(target)
            if Int.max == availableSevers[pos] {
                pos = 1
            }
            let info = Info(server: availableSevers[pos], time: endTime)
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: info)
            CFBinaryHeapAddValue(busyServers, pointer)
            cnt[availableSevers[pos]] += 1
            availableSevers = [Int](availableSevers[..<pos]) + [Int](availableSevers[(pos + 1)...])
            // 待探究，效率极低
            // availableSevers.remove(at: pos)
        }


        let maxLoad = cnt.max()!
        var ans = [Int]()
        for serverIdx in 0..<k {
            if cnt[serverIdx] == maxLoad {
                ans.append(serverIdx)
            }
        }
        return ans
    }
}