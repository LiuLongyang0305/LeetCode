// https://leetcode.com/problems/maximum-number-of-robots-within-budget/
import CoreFoundation

extension CFBinaryHeap {
    static public func getMaxHeapOfInt() -> CFBinaryHeap? {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a, b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareGreaterThan : .compareLessThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
    static public func getMinHeapOfInt() -> CFBinaryHeap? {
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
    func maximumRobots(_ chargeTimes: [Int], _ runningCosts: [Int], _ budget: Int) -> Int {

        let N = chargeTimes.count
        var preffix = [0]
        for rc in runningCosts {
            preffix.append((preffix.last ?? 0) + rc)
        }
        func check(_ k: Int) -> Bool {
            guard k > 0 else {return true}
            let heap = CFBinaryHeap.getMaxHeapOfInt()
            var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
            var removed = [Int:Int]()

            for i in 0..<N {
                if i >= k {
                    let del = chargeTimes[i - k]
                    let top = CFBinaryHeapGetMinimum(heap).load(as: Int.self)
                    if top == del {
                        CFBinaryHeapRemoveMinimumValue(heap)
                    } else {
                        removed[del,default: 0] += 1
                    }
                }
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: chargeTimes[i])
                CFBinaryHeapAddValue(heap, pointer)
                if i >= k - 1 {
                    while true {
                        let top = CFBinaryHeapGetMinimum(heap).load(as: Int.self)
                        guard let c = removed[top], c > 0 else {
                            break
                        }
                        CFBinaryHeapRemoveMinimumValue(heap)
                        if c == 1 {
                            removed.removeValue(forKey: top)
                        } else {
                            removed[top] = c - 1
                        }
                    }
                    let top = CFBinaryHeapGetMinimum(heap).load(as: Int.self)
                    let t = top + k * (preffix[i + 1] - preffix[i - k + 1])
//                    print("left = \(i - k + 1), r = \(i),  t = \(t)")
                    guard t > budget else {
                        return true
                    }
                }
            }


            return false
        }


        var left = 0
        var right = N
        while left < right {
            let mid = (left + right + 1) >> 1
            if check(mid) {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return left
    }
}
