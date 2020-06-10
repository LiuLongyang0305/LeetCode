// https://leetcode-cn.com/problems/bao-han-minhan-shu-de-zhan-lcof/
class MinStack {
    var data = Array<Int>()
    var minElement : Int = Int.max
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        data.insert(x, at: 0)
        if x < minElement {
            minElement = x
        }
    }
    
    func pop() {
        if !data.isEmpty {
            let temp = data.removeFirst()
            if temp == minElement {
                minElement = data.isEmpty ? Int.max : data.min()!
            }
        }
    }
    
    func top() -> Int {
        return data[0]
    }
    
    func min() -> Int {
        return minElement
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.min()
 */