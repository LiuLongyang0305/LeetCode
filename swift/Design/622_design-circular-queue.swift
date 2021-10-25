// https://leetcode.com/problems/design-circular-queue/
class MyCircularQueue {
    var data = [Int]()
    private let queueSize: Int
    init(_ k: Int) {
        self.queueSize = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else {
            return false
        }
        data.append(value)
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else {
            return false
        }
        data.removeFirst()
        return true
    }
    
    func Front() -> Int {
        return data.first ?? -1
    }
    
    func Rear() -> Int {
        return data.last ?? -1
    }
    
    func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    func isFull() -> Bool {
        return data.count == queueSize
    }
}
class MyCircularQueue1 {
    private var data: [Int]
    private var head = 0
    private var tail = 0
    init(_ k: Int) {
        data = [Int](repeating: -1, count: k + 1)
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else {
            return false
        }
        data[tail] = value
        tail += 1
        if(tail == data.count) {
            tail = 0
        }
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else {
            return false
        }
        head += 1
        if(head == data.count) {
            head = 0
        }
        return true
    }
    
    func Front() -> Int {
        return isEmpty() ? -1 : data[head]
    }
    
    func Rear() -> Int {
        guard !isEmpty() else {
            return -1
        }
        var t = tail - 1
        if t < 0 {
            t += data.count
        }
        return data[t]
    }
    
    func isEmpty() -> Bool {
        return head == tail
    }
    
    func isFull() -> Bool {
        return (tail + 1) % data.count == head
    }
}
/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */


