// https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/
class CQueue {
   private  var inStack = [Int]()
    private var outStack = [Int]()
    init() {

    }
    
    func appendTail(_ value: Int) {
        inStack.append(value)
    }
    
    func deleteHead() -> Int {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.append(inStack.removeLast())
            }
        }
        guard !outStack.isEmpty else {
            return -1
        }
        return outStack.removeLast()
    }
}


/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */