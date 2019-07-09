//https://leetcode.com/problems/implement-stack-using-queues/
class MyStack {
    
    var pushQueue = Array<Int>()
    var popQueue = Array<Int>()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        pushQueue.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        while pushQueue.count > 1 {
            popQueue.append(pushQueue.removeFirst())
        }
        let target = pushQueue.removeFirst()
        pushQueue = popQueue
        popQueue.removeAll()
        return target
    }
    
    /** Get the top element. */
    func top() -> Int {
        while pushQueue.count > 1 {
            popQueue.append(pushQueue.removeFirst())
        }
        let target = pushQueue[0]
        pushQueue.insert(contentsOf: popQueue, at: 0)
        popQueue.removeAll()
        return target
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return pushQueue.isEmpty
    }
}
