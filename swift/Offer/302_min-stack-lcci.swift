// https://leetcode-cn.com/problems/min-stack-lcci/
class MinStack {
    private var values = Array<Int>()
    var minStack = Array<Int>()
    /** initialize your data structure here. */
    init() {

    }
    
    func push(_ x: Int) {
        values.append(x)
        if minStack.isEmpty || x <= minStack.last! {
            minStack.append(x)
        }
    }
    
    func pop() {
        guard !values.isEmpty else {
            return
        }
        if values.last! == minStack.last! {
            minStack.removeLast()
        }
        values.removeLast()
    }
    
    func top() -> Int {
        return values.last ?? 0
    }
    
    func getMin() -> Int {
        return minStack.last ?? 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */