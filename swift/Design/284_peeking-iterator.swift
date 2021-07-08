// https://leetcode.com/problems/peeking-iterator/
// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {
    private var iterator: IndexingIterator<Array<Int>>
    private var lastValue: Int?
    init(_ arr: IndexingIterator<Array<Int>>) {
        self.iterator = arr
        self.lastValue = iterator.next()
    }
    
    func next() -> Int {
        let previous = lastValue
        lastValue = iterator.next()
        return previous ?? 0
    }
    
    func peek() -> Int {
        return lastValue ?? 0
    }
    
    func hasNext() -> Bool {
        return nil != lastValue
    }
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * let obj = PeekingIterator(arr)
 * let ret_1: Int = obj.next()
 * let ret_2: Int = obj.peek()
 * let ret_3: Bool = obj.hasNext()
 */