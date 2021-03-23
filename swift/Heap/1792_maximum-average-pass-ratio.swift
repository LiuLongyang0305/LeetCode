// https://leetcode.com/problems/maximum-average-pass-ratio/
import CoreFoundation
typealias Triple = (Double, Double, Double)
class Solution {
    @inline(__always) internal func getItem(_ pass: Double, _ total: Double) -> Triple {
        return (pass, total, (pass + 1) / (total + 1) - pass / total)
    }
    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {        
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { (a, b, _) in
             let x: Triple = a!.load(as: Triple.self), y: Triple = b!.load(as: Triple.self)
             let result = x.2 == y.2 ? 0 : (x.2 < y.2 ? 1 : -1)
             return result
        }
        var heap = CFBinaryHeapCreate(nil, 0, &callbacks, nil), pointer = UnsafeMutablePointer<Triple>.allocate(capacity: 1), result = 0.0
        for item in classes {
            pointer = UnsafeMutablePointer<Triple>.allocate(capacity: 1)
            pointer.initialize(to: self.getItem(Double(item[0]), Double(item[1])))
            CFBinaryHeapAddValue(heap, pointer)
        }
        for _ in 0..<extraStudents {
            let item: Triple = CFBinaryHeapGetMinimum(heap).load(as: Triple.self)
            CFBinaryHeapRemoveMinimumValue(heap)
            pointer = UnsafeMutablePointer<Triple>.allocate(capacity: 1)
            pointer.initialize(to: self.getItem(item.0 + 1, item.1 + 1))
            CFBinaryHeapAddValue(heap, pointer)
        }
        for _ in 0..<classes.count {
            let item: Triple = CFBinaryHeapGetMinimum(heap).load(as: Triple.self)
            CFBinaryHeapRemoveMinimumValue(heap)
            result += item.0 / item.1
        }
        pointer.deinitialize(count: 1)
        pointer.deallocate()
        return result / Double(classes.count)
    }
}

/*******************************************************************/

struct ClassInfo: Comparable, CustomDebugStringConvertible  {
    var debugDescription: String {
        return "delta = \(delta)   "
    }
    
   var pass: Int
   var total: Int
   var ratio: Double {
       return Double(pass) / Double(total)
   }
   var delta: Double {
       return Double(total - pass) / Double(total * (total + 1))
   }
   static func < (lhs: ClassInfo, rhs: ClassInfo) -> Bool {
       return lhs.delta < rhs.delta
   }
}
public struct Heap<T> {
    
    public var nodes = [T]()
    
    private var orderCriteria: (T,T) -> Bool
    
    public init(sort: @escaping (T,T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public init(array: [T], sort: @escaping (T,T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count >> 1) - 1, through: 0, by: -1) {
            shiftDown(from: i)
        }
    }
    


    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    public var count: Int {
        return nodes.count
    }
    
    @inline(__always) internal func parentIndex(ofIndex i : Int) -> Int {
        return (i - 1) >> 1
    }
    @inline(__always) internal func leftChildIndex(ofIndex i : Int) -> Int {
        return 2 * i + 1
    }
    @inline(__always) internal func rightChildIndex(ofIndex i : Int) -> Int {
        return 2 * i + 2
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func insert<S:Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else {
            return
        }
        remove(at: i)
        insert(value)
    }
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else {
            return nil
        }
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
    
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(from: 0)
            return value
        }
    }
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        while parentIndex > 0 && orderCriteria(child,nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        nodes[childIndex] = child
    }
    
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        guard first != index else {
            return
        }
        nodes.swapAt(first, index)
        shiftDown(from: first, until: endIndex)
    }
    
    internal mutating func shiftDown(from index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
    
}


extension Heap where T: Equatable {
    public func index(of node: T) -> Int? {
        return nodes.firstIndex(of: node)
    }
    @discardableResult public mutating func remove(node: T) -> T? {
        guard let index = index(of: node) else {
            return nil
        }
        return remove(at: index)
    }
}


public struct PriorityQueue<T> {
    public var heap: Heap<T>
    public init(from arr: [T],sort: @escaping (T,T) -> Bool) {
        heap = Heap<T>(array: arr, sort: sort)
    }
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    public var count: Int {
        return heap.count
    }
    public func peek() -> T? {
        return heap.peek()
    }
    public mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    public mutating func dequeue() -> T? {
        return heap.remove()
    }
    public mutating func changePriority(index i : Int,value: T) {
        return heap.replace(index: i, value: value)
    }
}

extension PriorityQueue where T: Equatable {
    public func index(of element: T) -> Int? {
        return heap.index(of: element)
    }
}


extension PriorityQueue where T : CustomDebugStringConvertible {
    public func disply() {
        print(heap)
    }
}


class Solution {

    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
        guard classes.count > 1 else {
            return Double(classes[0][0] + extraStudents) / Double(classes[0][1] + extraStudents)
        }
        let classesInfos = classes.map { ClassInfo(pass: $0[0], total: $0[1])}
        var priorityQueue = PriorityQueue<ClassInfo>(from: classesInfos) { $0 > $1}
//        print(priorityQueue.heap.nodes)
        var remainExtraStudents = extraStudents
        while remainExtraStudents > 0 {
            var first = priorityQueue.dequeue()!
            let secondDelta = priorityQueue.peek()?.delta ?? 0
            while remainExtraStudents > 0 && first.delta >= secondDelta {
                first.pass += 1
                first.total += 1
                remainExtraStudents -= 1
            }
            priorityQueue.enqueue(first)
        }
        return priorityQueue.heap.nodes.reduce(0.0, {$0 + $1.ratio}) / Double(classes.count)
    }
}