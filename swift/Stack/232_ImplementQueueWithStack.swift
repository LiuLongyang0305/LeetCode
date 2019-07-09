//https://leetcode.com/problems/implement-queue-using-stacks/
class MyQueue {
    
    var pushStack = Array<Int>()
    var popStack = Array<Int>()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        pushStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if popStack.isEmpty {
            while !pushStack.isEmpty {
                popStack.append(pushStack.removeLast())
            }
        }
        return popStack.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if pushStack.isEmpty {
            return popStack.last!
        }
        return pushStack.first!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return pushStack.isEmpty && popStack.isEmpty
    }
}
