//https://leetcode.com/problems/insert-delete-getrandom-o1/
class RandomizedSet {

    private var elements = Array<Int>()
    private var valueAndIndex = [Int:Int]()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        guard  nil == valueAndIndex[val] else {
            return false
        }
        elements.append(val)
        valueAndIndex[val] =  elements.count - 1
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        guard nil != valueAndIndex[val] else {
            return false
        }
        let index = valueAndIndex[val]!
        elements.remove(at: index)
        valueAndIndex.removeValue(forKey: val)
        for (val,index0) in valueAndIndex {
            if index0 > index {
                valueAndIndex.updateValue(index0 - 1, forKey: val)
            }
        }
        return true
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return elements[Int.random(in: 0..<elements.count)]
        
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */