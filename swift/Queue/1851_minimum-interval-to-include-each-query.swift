// https://leetcode.com/problems/minimum-interval-to-include-each-query/
import CoreFoundation
struct Interval: Comparable,Equatable {
    static func < (lhs: Interval, rhs: Interval) -> Bool {
        return lhs.length < rhs.length
    }
    
    var left: Int
    var right: Int
    var length: Int
}

extension CFBinaryHeap {
    static func getMinHeapInstance() ->  CFBinaryHeap {
        var callBacks: CFBinaryHeapCallBacks = CFBinaryHeapCallBacks()
        callBacks.compare = {a,b,_ in
            let x = a!.load(as: Interval.self)
            let y = b!.load(as: Interval.self)
            return x == y ? 0 : (x < y ? -1 : 1)
        }
        return CFBinaryHeapCreate(nil, 0, &callBacks, nil)
    }
}
class Solution {
    private let minHeap = CFBinaryHeap.getMinHeapInstance()
    func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
        let M = intervals.count
        let N = queries.count
        let sortedQuerrIndices = (0..<N).sorted {queries[$0] < queries[$1]}
        var ans = Array<Int>(repeating: -1, count: N)
        var pointer: UnsafeMutablePointer<Interval> = .allocate(capacity: 1)
        let sortedIntervals = intervals.map { Interval(left: $0[0], right: $0[1], length: $0[1] - $0[0] + 1)}.sorted { first, second in
            first.left < second.left
        }
        var intervalIdx = 0
        for queryIdx in sortedQuerrIndices {
            while intervalIdx < M && queries[queryIdx] >= sortedIntervals[intervalIdx].left {
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: sortedIntervals[intervalIdx])
                CFBinaryHeapAddValue(minHeap, pointer)
                intervalIdx += 1
            }
            while CFBinaryHeapGetCount(minHeap) > 0 {
                let v = CFBinaryHeapGetMinimum(minHeap).load(as: Interval.self)
                guard v.right < queries[queryIdx] else {
                    break
                }
                CFBinaryHeapRemoveMinimumValue(minHeap)
            }
            guard CFBinaryHeapGetCount(minHeap) > 0 else {
                continue
            }
            ans[queryIdx] = CFBinaryHeapGetMinimum(minHeap).load(as: Interval.self).length
        }
        pointer.deallocate()
        if CFBinaryHeapGetCount(minHeap) > 0 {
            CFBinaryHeapRemoveAllValues(minHeap)
        }
        return ans
    }
}