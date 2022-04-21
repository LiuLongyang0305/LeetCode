 // https://leetcode.com/problems/maximum-product-after-k-increments/
import CoreFoundation

extension CFBinaryHeap {
    static public func getMinHeapOfInt() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a, b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
class Solution {
    private let MOD = 1_000_000_007
    func maximumProduct(_ nums: [Int], _ k: Int) -> Int {
        var zerosCnt = 0
        for num in nums {
            if num == 0 {
                zerosCnt += 1
            }
        }

        guard zerosCnt <= k else {
            return 0
        }
        guard zerosCnt < k else {return 1}

        var operationsLeft = k - zerosCnt

        let minHeap = CFBinaryHeap.getMinHeapOfInt()
        var pointer:UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        for num in nums {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: max(1,num))
            CFBinaryHeapAddValue(minHeap, pointer)
        }


        while operationsLeft > 0 {
            let top = CFBinaryHeapGetMinimum(minHeap).load(as: Int.self)
            CFBinaryHeapRemoveMinimumValue(minHeap)
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: top + 1)
            CFBinaryHeapAddValue(minHeap, pointer)
            operationsLeft -= 1
        }
        var ans = 1
        while CFBinaryHeapGetCount(minHeap) > 0 {
            let top = CFBinaryHeapGetMinimum(minHeap).load(as: Int.self)
            ans = ans * top % MOD
            CFBinaryHeapRemoveMinimumValue(minHeap)
        }
        return ans
    }
}
