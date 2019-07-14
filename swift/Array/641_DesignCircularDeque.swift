//https://leetcode.com/problems/design-circular-deque/
class MyCircularDeque {
    
    private var  deque = Array<Int>()
    private  var  maxCapacity = -1
    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        maxCapacity = k
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if deque.count < maxCapacity {
            deque.insert(value, at: 0)
            return true
        }
        return false
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if deque.count < maxCapacity {
            deque.append(value)
            return true
        }
        return false
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if deque.isEmpty {
            return false
        }
        deque.removeFirst()
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if deque.isEmpty {
            return false
        }
        deque.removeLast()
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        if deque.isEmpty {
            return -1
        }
        return deque[0]
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        if deque.isEmpty {
            return -1
        }
        return deque.last!
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return deque.isEmpty
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return deque.count == maxCapacity
    }
}


/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */