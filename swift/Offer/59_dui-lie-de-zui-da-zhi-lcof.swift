// https://leetcode-cn.com/problems/dui-lie-de-zui-da-zhi-lcof/
class MaxQueue {
    private var maxQueue = [Int]()
    private var queue = [Int]()
    init() {
        
    }
    
    func max_value() -> Int {
        return maxQueue.first ?? -1
    }
    
    func push_back(_ value: Int) {
        queue.append(value)
        while !maxQueue.isEmpty && (maxQueue.last! < value){
            maxQueue.popLast()
        }
        maxQueue.append(value)
    }
    
    func pop_front() -> Int {
        if queue.isEmpty {
            return -1
        }
        if queue.first! == maxQueue.first! {
            maxQueue.removeFirst()
        }
        return queue.removeFirst()
        
    }
}
/**
 * Your MaxQueue object will be instantiated and called as such:
 * let obj = MaxQueue()
 * let ret_1: Int = obj.max_value()
 * obj.push_back(value)
 * let ret_3: Int = obj.pop_front()
 */