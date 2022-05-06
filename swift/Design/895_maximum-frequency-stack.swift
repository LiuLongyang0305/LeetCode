// https://leetcode.com/problems/maximum-frequency-stack/
import CoreFoundation

struct Triple {
    var val: Int
    var cnt: Int
    var order: Int
}

extension CFBinaryHeap {
    static public func getMaxHeapOfTriple() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = {  a, b,_ in
            let x = a!.load(as: Triple.self)
            let y = b!.load(as: Triple.self)
            guard x.cnt != y.cnt else {
                return x.order > y.order ? .compareLessThan : .compareGreaterThan
            }
            return x.cnt > y.cnt ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}

class FreqStack {


    private let maxHeap = CFBinaryHeap.getMaxHeapOfTriple()
    private var counter = [Int:Int]()
    private var pointer: UnsafeMutablePointer<Triple> = .allocate(capacity: 1)
    private var order = 0
    init() {

    }

    func push(_ val: Int) {
        counter[val,default: 0] += 1
        let p = Triple(val: val, cnt: counter[val] ?? 0, order: order)
        pointer = .allocate(capacity: 1)
        pointer.initialize(to: p)
        CFBinaryHeapAddValue(maxHeap, pointer)
        order += 1
    }

    func pop() -> Int {
        let top = CFBinaryHeapGetMinimum(maxHeap).load(as: Triple.self)
        CFBinaryHeapRemoveMinimumValue(maxHeap)
        counter[top.val, default: 0] -= 1
        return top.val
    }
}


/**
 * Your FreqStack object will be instantiated and called as such:
 * let obj = FreqStack()
 * obj.push(val)
 * let ret_2: Int = obj.pop()
 */