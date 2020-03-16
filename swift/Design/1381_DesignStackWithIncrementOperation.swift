// https://leetcode.com/problems/design-a-stack-with-increment-operation/
class CustomStack {
    private var maxSize = -1
    private var arr = [Int]()
    private var inc = [Int]()
    init(_ maxSize: Int) {
        self.maxSize = maxSize
    }
    
    func push(_ x: Int) {
        if arr.count < maxSize {
            arr.append(x)
            inc.append(0)
        }
    }
    
    func pop() -> Int {
        guard !arr.isEmpty else {
            return -1
        }
        let maxIndex = arr.count - 1
        if maxIndex > 0 {
            inc[maxIndex - 1] += inc[maxIndex]
        }
        return arr.removeLast() + inc.removeLast()
    }
    
    func increment(_ k: Int, _ val: Int) {
        let index = min(k,arr.count) - 1
        if index >= 0 {
            inc[index] += val
        }
    }
}


/**
 * Your CustomStack object will be instantiated and called as such:
 * let obj = CustomStack(maxSize)
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * obj.increment(k, val)
 */