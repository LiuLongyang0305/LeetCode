//https://leetcode.com/problems/rle-iterator/

class RLEIterator {
    
    var times: [Int]
    var elements: [Int]
    init(_ A: [Int]) {
        times = Array<Int>(repeating: 0, count: A.count /  2)
        elements = Array<Int>(repeating: 0, count: A.count /  2)
        var i = 0
        while i < A.count / 2 {
            times[i] = A[2 * i]
            elements[i] = A[2 * i + 1]
            i += 1
        }
    }
    
    func next(_ n: Int) -> Int {
        if elements.isEmpty {
            return -1
        }
        let temp = times[0]
        if n < temp {
            times[0] -= n
            return elements.first!
        }
        if n == temp {
            let value = elements[0]
            times.removeFirst()
            elements.removeFirst()
            return value
        }
        let nextN = n - times[0]
        times.removeFirst()
        elements.removeFirst()
        return next(nextN)
    }
}

/**
 * Your RLEIterator object will be instantiated and called as such:
 * let obj = RLEIterator(A)
 * let ret_1: Int = obj.next(n)
 */