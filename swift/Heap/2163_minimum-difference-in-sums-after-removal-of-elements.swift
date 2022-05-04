 // https://leetcode.com/problems/minimum-difference-in-sums-after-removal-of-elements/
import CoreFoundation
extension CFBinaryHeap {
    static public func getMaxHeapOfInt() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a, b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareGreaterThan : .compareLessThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
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
    func minimumDifference(_ nums: [Int]) -> Int {
        let N = nums.count
        let M = N / 3

        let minHeap = CFBinaryHeap.getMinHeapOfInt()
        let maxHeap = CFBinaryHeap.getMaxHeapOfInt()
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)

        var sumFirst = 0
        var sumSecond = 0
        var idxToMinSumFirst = [Int:Int]()
        var idxToMaxSumSecond = [Int:Int]()

        func addvalue(to heap: CFBinaryHeap, _ num: Int) {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: num)
            CFBinaryHeapAddValue(heap, pointer)
        }

        func removeMinumValue(from heap: CFBinaryHeap) -> Int {
            let top = CFBinaryHeapGetMinimum(heap).load(as: Int.self)
            CFBinaryHeapRemoveMinimumValue(heap)
            return top
        }



        for i in 0..<M {
            sumFirst += nums[i]
            addvalue(to: maxHeap, nums[i])
        }

        idxToMinSumFirst[M - 1] = sumFirst

        for i in M..<(2 * M) {
            sumFirst += nums[i]
            addvalue(to: maxHeap, nums[i])
            sumFirst -= removeMinumValue(from: maxHeap)
            idxToMinSumFirst[i] = sumFirst
        }


        for i in (2 * M)..<N {
            sumSecond += nums[i]
            addvalue(to: minHeap, nums[i])
        }


        idxToMaxSumSecond[2 * M] = sumSecond

        var i = 2 * M - 1
        while i >= M {
            sumSecond += nums[i]
            addvalue(to: minHeap, nums[i])
            sumSecond -= removeMinumValue(from: minHeap)
            idxToMaxSumSecond[i] = sumSecond
            i -= 1
        }

        var ans = Int.max

        for (idx,v) in idxToMinSumFirst {
            ans = min(ans, v - idxToMaxSumSecond[idx + 1]!)
        }

        return ans
    }
}
