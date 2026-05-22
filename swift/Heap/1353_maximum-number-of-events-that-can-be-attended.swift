// https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended
class Solution {
    func maxEvents(_ events: [[Int]]) -> Int {
        let sortedEvents = events.sorted { $0[0] < $1[0]}
        var heap = Heap<Int>()
        var eventIdx = 0
        let N = sortedEvents.count
        var ans = 0
        for time in 1...100000 {
            while eventIdx < N && sortedEvents[eventIdx][0] <= time {
                heap.insert(sortedEvents[eventIdx][1])
                eventIdx += 1
            }
            while let firstEndTime = heap.min, firstEndTime < time {
                heap.popMin()
            }
            if !heap.isEmpty {
                ans += 1
                heap.popMin()
            }
        }
        return ans
    }
}
