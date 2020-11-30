// https://leetcode.com/problems/design-front-middle-back-queue/
class FrontMiddleBackQueue {
    private var values = Array<Int>()
    init() {
    }
    
    func pushFront(_ val: Int) {
        values.insert(val, at: 0)
    }
    
    func pushMiddle(_ val: Int) {
        let N = values.count >> 1
        values.insert(val, at: N)
    }
    
    func pushBack(_ val: Int) {
        values.append(val)
    }
    
    func popFront() -> Int {
        guard !values.isEmpty else {
            return -1
        }
        return values.removeFirst()
    }
    
    func popMiddle() -> Int {
        guard !values.isEmpty else {
            return -1
        }
        let N = values.count
        return values.remove(at: (N >> 1) - (N % 2 == 0 ? 1 : 0))
    }
    
    func popBack() -> Int {
        guard !values.isEmpty else {
            return -1
        }
        return values.removeLast()
    }
}





/**
 * Your FrontMiddleBackQueue object will be instantiated and called as such:
 * let obj = FrontMiddleBackQueue()
 * obj.pushFront(val)
 * obj.pushMiddle(val)
 * obj.pushBack(val)
 * let ret_4: Int = obj.popFront()
 * let ret_5: Int = obj.popMiddle()
 * let ret_6: Int = obj.popBack()
 */

