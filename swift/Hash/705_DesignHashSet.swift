//https://leetcode.com/problems/design-hashset/
class MyHashSet {
    var myHashSet = Set<Int>()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    func add(_ key: Int) {
        myHashSet.insert(key)
    }
    
    func remove(_ key: Int) {
        if  myHashSet.contains(key){
            myHashSet.remove(key)
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        return myHashSet.contains(key)
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */