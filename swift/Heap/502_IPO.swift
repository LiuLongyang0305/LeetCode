// https://leetcode.com/problems/ipo/
import CoreFoundation
extension CFBinaryHeap {
    public static func getMaxHeapOfInt() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = {  a,b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareGreaterThan : .compareLessThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}


class Solution {
    func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
        let M = profits.count
        let sortedIdx = (0..<M).sorted { i, j in
            if capital[i] == capital[j] {
                return profits[i] > profits[j]
            }
            return capital[i] < capital[j]
        }
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        let maxHeapOfProfit = CFBinaryHeap.getMaxHeapOfInt()
        var W = w
        var cur = 0
        
        for _ in 0..<k {
            while cur < M && capital[sortedIdx[cur]] <= W {
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: profits[sortedIdx[cur]])
                CFBinaryHeapAddValue(maxHeapOfProfit, pointer)
                cur += 1
            }
            guard CFBinaryHeapGetCount(maxHeapOfProfit) > 0 else {
                break
            }
            W += CFBinaryHeapGetMinimum(maxHeapOfProfit).load(as: Int.self)
            CFBinaryHeapRemoveMinimumValue(maxHeapOfProfit)
        }
        
        defer {
            pointer.deallocate()
            CFBinaryHeapRemoveAllValues(maxHeapOfProfit)
        }
        return W
    }
}


