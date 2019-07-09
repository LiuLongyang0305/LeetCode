/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedIterator {
    
    var ans = [Int]()
    var currentIndex = -1
    var length = -1
    
    init(_ nestedList: [NestedInteger]) {
        self.ans = trverseNestedList(nestedList: nestedList)
        length = ans.count

        if length > 0 {
            currentIndex = 0
        }
    }
    
    func next() -> Int {
        
        currentIndex += 1
        return ans[currentIndex - 1]
    }
    
    func hasNext() -> Bool {
        return !(currentIndex == -1 || currentIndex >= length)
    }
    
    private func trverseNestedList(nestedList: [NestedInteger]) -> [Int] {
        var currentResult = [Int]()
        
        for ele in nestedList {
            if ele.isInteger() {
                currentResult.append(ele.getInteger())
            } else {
                currentResult.append(contentsOf: trverseNestedList(nestedList: ele.getList()))
            }
        }
        
        return currentResult
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */