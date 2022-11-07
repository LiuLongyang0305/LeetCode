// https://leetcode.com/problems/total-cost-to-hire-k-workers/
import CoreFoundation
struct Info {
    var idx: Int
    var cost: Int
}
extension CFBinaryHeap {
    static public func getMinHeapOfInfo() -> CFBinaryHeap? {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a, b,_ in
            let x = a!.load(as: Info.self)
            let y = b!.load(as: Info.self)
            if x.cost == y.cost {
                return x.idx < y.idx ? .compareLessThan : .compareGreaterThan
            }
            return x.cost < y.cost ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
class Solution {
    func totalCost(_ costs: [Int], _ k: Int, _ candidates: Int) -> Int {
        var cost = 0
        var pointer: UnsafeMutablePointer<Info> = .allocate(capacity: 1)
        let N = costs.count
        let minHeap = CFBinaryHeap.getMinHeapOfInfo()

        func add(_ idx: Int) {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: Info(idx: idx, cost: costs[idx]))
            CFBinaryHeapAddValue(minHeap, pointer)
        }
        
        var nextLeftIdx = N
        var nextRightIdx = -1
        if 2 * candidates >= N {
            for i in 0..<N {
                add(i)
            }
        } else {
            for i in 0..<candidates {
                add(i)
                add(N - 1 - i)
            }
            nextLeftIdx = candidates
            nextRightIdx = N - 1 - candidates
        }
        for _ in 0..<k {
            let top = CFBinaryHeapGetMinimum(minHeap).load(as: Info.self)
            cost += top.cost
            CFBinaryHeapRemoveMinimumValue(minHeap)
            if nextLeftIdx <= nextRightIdx {
                if top.idx < nextLeftIdx {
                    add(nextLeftIdx)
                    nextLeftIdx += 1
                    
                } else {
                    add(nextRightIdx)
                    nextRightIdx -= 1
                }
            }
        }
        return cost
    }
}

