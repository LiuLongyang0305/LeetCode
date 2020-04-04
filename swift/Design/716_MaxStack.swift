// https://leetcode.com/problems/max-stack/
class MaxStack {

    var stack = [Int]()
    var cache = [Int]()
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if cache.isEmpty {
            cache.append(x)
        } else {
            if x >= cache.last! {
                cache.append(x)
            } else {
                cache.append(x)
                cache.sort()
            }
        }
    }
    
    func pop() -> Int {
        let pop = stack.removeLast()
        if pop >= cache.last! {
            cache.removeLast()
        } else {
            cache.remove(at: cache.lastIndex(of: pop)!)
        }
        return pop
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func peekMax() -> Int {
        return cache.last!
    }
    
    func popMax() -> Int {
        let max = cache.removeLast()
        return stack.remove(at: stack.lastIndex(of: max)!)
    }
}

/**
 * Your MaxStack object will be instantiated and called as such:
 * let obj = MaxStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.peekMax()
 * let ret_5: Int = obj.popMax()
 */
