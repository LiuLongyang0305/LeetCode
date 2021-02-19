// https://leetcode.com/problems/design-most-recently-used-queue/
class MRUQueue {
    private var data: [Int]
    init(_ n: Int) {
        data = Array<Int>(1...n)
    }
    
    func fetch(_ k: Int) -> Int {
        let t = data.remove(at: k - 1)
        data.append(t)
        return t
    }
}

/**
 * Your MRUQueue object will be instantiated and called as such:
 * let obj = MRUQueue(n)
 * let ret_1: Int = obj.fetch(k)
 */