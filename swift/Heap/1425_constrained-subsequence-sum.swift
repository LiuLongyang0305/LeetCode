// https://leetcode.com/problems/constrained-subsequence-sum/
import CoreFoundation

struct State {
    var val: Int
    var idx: Int
}

extension CFBinaryHeap {
    public static func getMaxHeapOfState() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = { a,b,_ in
            let x = a!.load(as: State.self)
            let y = b!.load(as: State.self)
            guard x.val != y.val else {
                return x.idx > y.idx ? .compareLessThan : .compareGreaterThan
            }
            return x.val > y.val ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}

class Solution {
    func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
        let maxHeap = CFBinaryHeap.getMaxHeapOfState()
        var pointer: UnsafeMutablePointer<State> = .allocate(capacity: 1)
        pointer.initialize(to: State(val: 0, idx: -1))
        CFBinaryHeapAddValue(maxHeap, pointer)
        var ans = Int.min
        let N = nums.count
        for idx in 0..<N {
            while CFBinaryHeapGetCount(maxHeap) > 0 {
                let top = CFBinaryHeapGetMinimum(maxHeap).load(as: State.self)
                guard idx - top.idx > k  else {
                    break
                }
                CFBinaryHeapRemoveMinimumValue(maxHeap)
            }
            let top = CFBinaryHeapGetMinimum(maxHeap).load(as: State.self)
            let v = max(nums[idx], top.val + nums[idx])
            ans = max(ans, v)
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: State(val: v, idx: idx))
            CFBinaryHeapAddValue(maxHeap, pointer)
        }
        defer {
            CFBinaryHeapRemoveAllValues(maxHeap)
            pointer.deallocate()
        }
        return ans
    }
}